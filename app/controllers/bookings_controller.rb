class BookingsController < ApplicationController
  def index
    @bookins = Booking.where("user_id = #{current_user.id}")
  end
end
