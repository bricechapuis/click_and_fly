class UsersController < ApplicationController
  def my_planes
    @planes = Plane.where(user_id: current_user.id)
  end
end
