class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if params[:where].present? || params[:capacity].present? || params[:start].present? || params[:end].present?
      params[:capacity] = 0 if params[:capacity] == ''
      query = "planes.capacity >= :capacity"
      params[:start] = Date.today.to_s if params[:start] == ''
      params[:end] = params[:start] if params[:end] == ''
      planes = Plane.near(params[:where].to_s, 100).where(query, capacity: params[:capacity].to_s)
      @planes = []
      planes.each do |plane|
        available_arr = []
        unless plane.bookings.empty?
          plane.bookings.each do |booking|
            if (Date.parse(params[:start]) > booking.end_date) || (Date.parse(params[:end]) < booking.start_date)
              available = true
            else available = false
            end
            available_arr << available
          end
        end
        @planes << plane unless available_arr.include?(false)
      end
      @planes
    else
      @planes = policy_scope(Plane).order(created_at: :desc)
    end

    @markers = @planes.map do |plane|
      {
        lng: plane.longitude,
        lat: plane.latitude
      }
    end
  end

  def show
    @plane = Plane.find(params[:id])
    @review = Review.new # <-- This is for the review.
    @booking = Booking.new
    @marker = [{ lat: @plane.latitude, lng: @plane.longitude }]
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
