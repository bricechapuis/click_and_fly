class ReviewsController < ApplicationController
  skip_after_action :verify_authorized

  def create
      @plane = Plane.find(params[:plane_id])
      @review = Review.new(review_params)
      @review.plane = @plane
      @booking = Booking.new
      if @review.save
        redirect_to plane_path(@plane)
      else
        render 'planes/show'
      end
    end

    private

    def review_params
      params.require(:review).permit(:content)
    end
end
