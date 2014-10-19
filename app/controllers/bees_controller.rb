class BeesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :activate]

  def new
    @bee = Bee.new
  end

  def create
    @bee = Bee.new(bee_params)
    if @bee.save
      redirect_to root_path, notice: 'You sucessfully signed up. We send your email with activation instructions'
    else
      render :new, alert: 'Something goes wrong!'
    end
  end

  def activate
    if (@bee = Bee.load_from_activation_token(params[:id]))
      @bee.activate!
      auto_login(@bee)
      redirect_to dashboard_path, notice: 'Your acconut was successfully activated'
    else
      not_authenticated 'Wrong activation code'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  protected

  def bee_params
    params.require(:bee).permit(:name, :email, :password, :password_confirmation)
  end

end
