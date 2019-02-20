class UsersController < ApplicationController
  def my_planes
    # @planes = Plane.where(user_id: current_user.id)
    skip_authorization
    @planes = Plane.where(user_id: current_user.id).order(created_at: :desc)
  end
end
