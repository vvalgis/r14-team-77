class BeeSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @bee = Bee.new
  end

  def create
    @bee = login(params[:email], params[:password])
    if @bee
      redirect_back_or_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def try_it
    @bee = Bee.first
    auto_login(@bee)
    redirect_to dashboard_path, notice: 'Welcome'
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
