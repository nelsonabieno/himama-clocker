class ClockEventsController < ApplicationController
  before_action :set_user_event, only: [:destroy, :edit, :update]
  skip_before_action :verify_authenticity_token

  def index
    @user = User.all
  end

  def show

    if params[:id]
      @user_nickname = User.find(params[:id]).user_nick
      @clock_events= ClockEvent.all.where(:user_id=>params[:id])
    end
  end

  def update
    if @user_event.update(event_params)
      flash[:update_success] = "Update Successful!"
      redirect_to clockevents_path
    else
      flash[:update_error] = "Update Unsuccessful!!"
      render :show
    end

  end

  def destroy
    @user_event.destroy
    redirect_to clockevents_path
  end

  def edit
    @user_event
  end

  def clock_in
    if params[:id]
      @clock_in = ClockEvent.create(:user_id => params[:id], :clock_in => Time.now)
      if @clock_in
        flash[:clock_in] = "Clock In Successful @ #{Time.now.strftime("%I:%M:%S %Z %z")}"
      else
        flash[:error]= 'Ops! We couldn\'t Clock you at this time'
      end

      redirect_to dashboard_path
    end
  end

  def clock_out
    if params[:id]
      @clock_in = ClockEvent.create(:user_id => params[:id], :clock_out => Time.now)
      if @clock_in
        flash[:clock_out] = "Clock Out Successful @ #{Time.now.strftime("%I:%M:%S %Z %z")}"
      else
        flash[:error]= 'Ops! We couldn\'t Clock you at this time'
      end

      redirect_to dashboard_path
    end
  end

  private

  def set_user_event
    @user_event = ClockEvent.find( "#{params[:id]}")
  end

  def event_params
    params.permit(:clock_in, :clock_out)
  end
end
