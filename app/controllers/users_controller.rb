class UsersController < ApplicationController
  include AuthenticationHelper
  before_action :set_user, only: [:destroy, :show, :edit, :update, :login]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  def new
  end

  def home
    @user = User.find_by_user_nick("#{session[:user]}")
  end

  def login
    @user_nick = params[:user_nick]
    user_found = user_exists? @user_nick

    if user_found
      session[:user] = @user_nick
      @user.update(:login_status => true)
      redirect_to dashboard_path
    else
      @error = 'Invalid Login Details'
      render 'home/index'
      return
    end
  end

  def logout
    @user = User.find_by_user_nick("#{session[:user]}")
    @message = 'Successfully Logged Out!'

    if @user
      @user.update(:login_status => false)
      reset_session
    end

    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    user_nick = @user.user_nick
    user_found = user_exists? user_nick
    @user.login_status = false

    respond_to do |format|
      if user_found
        @error = ['Ops! This name already exists']
        format.json { render message: @message , status: :conflict}
      else
        if @user.valid? && @user.save!
          @message = 'user successfully registered'
          format.json { render message: @message  , status: :created }
          redirect_to root_path
          return
        end

        if @user.errors.any?
          @error = @user.errors.full_messages
          format.json { render errors: @error, status: :internal_server_error }
        end
      end

      format.html
      render 'users/new'
      return
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
    params.permit(:user_nick)
  end

  def set_user
    @user = User.find_by_user_nick("#{params[:user_nick]}")
  end
end
