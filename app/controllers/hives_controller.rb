class HivesController < ApplicationController
  def new
    @hive = current_user.hives.build
  end

  def create
    @hive = current_user.hives.build(hive_params) do |hive|
      hive.hive_memberships.build(bee: current_user, is_owner: true)
    end
    if @hive.save
      redirect_to dashboard_path, notice: %Q{Hive "#{@hive.name}" created}
    else
      render :new, alert: 'Something goes wrong!'
    end
  end

  def show
    @hive = current_user.hives.find params[:id]
  end

  protected

  def hive_params
    params.require(:hive).permit(:name, :description)
  end
end
