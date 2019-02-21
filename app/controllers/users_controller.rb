class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:my_planes]

  def my_planes
    @user = current_user
    authorize @user
    @planes = current_user.planes.order(created_at: :desc)
  end
end
