class ReviewsController < ApplicationController
  def create
      @plane = Plane.find(params[:plane_id])
      @review = Review.new(review_params)
      @review.plane = @plane
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
