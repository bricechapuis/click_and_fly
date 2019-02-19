class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
    @bookings_for_my_planes = Booking.where(plane_id: current_user.planes.ids[0])
    @planes = policy_scope(Plane).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @plane = Plane.find(params[:plane_id])
    @booking.user_id = current_user.id
    @booking.plane_id = @plane.id
    if @booking.save
      redirect_to plane_booking_path(@plane, @booking)
    else render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @plane = Plane.find(params[:plane_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @plane = Plane.find(params[:plane_id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to plane_booking_path(@plane, @booking)
    else render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def confirm_booking(argument)
    @booking = Booking.find(params[:id])
    @booking.status = argument
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :plane_id, :user_id)
  end
end
