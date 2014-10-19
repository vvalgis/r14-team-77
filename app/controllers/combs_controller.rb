class CombsController < ApplicationController

  before_action :load_hive

  def index
  end

  def show
    if @hive
      @comb = @hive.combs_visible_for(current_user, comb_id: params[:id])
    else
      @comb = nil
    end
  end

  def new
    @comb = current_user.combs.build(hive: @hive)
  end

  def create
    @comb = current_user.combs.build(comb_params.merge(hive: @hive))
    if @comb.save
      redirect_to hive_comb_path(@hive, @comb), notice: %Q{Comb "#{@comb.title}" created}
    else
      render :new, alert: 'Something goes wrong!'
    end
  end

  def edit
  end

  def update
  end

  def change_visibility
    params.permit(:visibility)
    @comb = current_user.combs.find params[:id]
    if @comb.update(visibility: params[:visibility])
      redirect_to hive_comb_path(@hive, @comb), notice: 'Visibility updated'
    else
      redirect_to hive_comb_path(@hive, @comb), notice: %Q{Can't change Visibility}
    end

  end

  protected

  def comb_params
    params.require(:comb).permit(:title, :description, :visibility)
  end

  def load_hive
    @hive = Hive.find params[:hive_id] if params[:hive_id].present?
  end
end
