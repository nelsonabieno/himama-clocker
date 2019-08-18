class UserController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :edit, :update]

  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  def create
    user = User.new(user_params)
    user.is_admin = false

    user_email = user.email
    user_found = user_exists? user_email

    respond_to do |format|
      if user_found
         format.json { render message: 'Ops! This email already exists', status: :conflict}
      else
        if user.valid? && user.save!
          format.json { render message: 'user successfully registered', status: :created }
        else
          format.json { render errors: user.errors.full_messages, status: :internal_server_error }
        end
      end
    end
  end

  def show
    render json: { user: @user }, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: { user: @user, message: 'user successfully updated' }, status: :ok
    else
      render json: { user: @user, errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render json: { user: @user, message: 'user successfully deleted' }, status: :ok
    else
      render json: { user: @user, errors: @user.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def user_params
    params.permit(
        :first_name,
        :last_name,
        :email,
        :password,
    )
  end

  def address_params
    params.permit(
        :street_address,
        :lga,
        :city,
        :state
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_exists? user_email
    User.find_by_email("#{user_email}")
  end
end

class UsersController < ApplicationController
  def create

  end

  private
  def user_params
    params.permit(:firstname, :lastname, :email, :password)
  end
end
