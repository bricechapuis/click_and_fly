class PlanesController < ApplicationController
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.user_id = current_user.id
    if @plane.save
      redirect_to planes_path
    else
      render :new
    end
  end

  def edit
    @plane = Plane.find(params[:id])
  end

  def update
    @plane = Plane.find(params[:id])
    @plane.user_id = current_user.id
    @plane.update(plane_params)
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :edit
    end
  end

  def destroy
    @plane = Plane.find(params[:id])
    @plane.destroy
    redirect_to planes_path
  end

  private

  def plane_params
    params.require(:plane).permit(:title, :description, :registration_number, :pilot, :autonomy, :capacity, :model, :airfield, :price)
  end
end
