class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.json { render message: 'welcome to Himama', status: :ok}
      format.html
    end
  end
end