class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @planes = policy_scope(Plane).order(created_at: :desc)
  end

  def show
    @plane = Plane.find(params[:id])
    @booking = Booking.new
    @marker = { lat: @plane.latitude, lng: @plane.longitude }
    authorize @plane
  end

  def new
    @plane = Plane.new
    authorize @plane
  end

  def create
    @plane = Plane.new(plane_params)
    authorize @plane
    @plane.user = current_user
    if @plane.save
      redirect_to planes_path
    else
      render :new
    end
  end

  def edit
    @plane = Plane.find(params[:id])
    authorize @plane
  end

  def update
    @plane = Plane.find(params[:id])
    @plane.user_id = current_user.id
    authorize @plane
    @plane.update(plane_params)
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :edit
    end
  end

  def destroy
    @plane = Plane.find(params[:id])
    authorize @plane
    @plane.user = current_user
    @plane.destroy
    redirect_to planes_path
  end

  private

  def plane_params
    params.require(:plane).permit(:title, :description, :registration_number, :pilot, :autonomy, :capacity, :model, :airfield, :price, :photo)
  end
end
