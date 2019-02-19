class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
    @bookings_for_my_planes = Booking.where(plane_id: current_user.planes.ids[0])
    @planes = policy_scope(Plane).order(created_at: :desc)
  end
end
