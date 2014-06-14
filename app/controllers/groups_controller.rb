class GroupsController < ApplicationController

  respond_to :json

  def request_ride
    user = User.new(user_params)
    user.profile_image = "empty.jpeg"
    user.leave_after = Time.now
    user.leave_before = Time.now
    if user.save && user.determine_group
      @group = user.group
    else
      raise "POW"
    end
  end

  def index
    @group = Group.first
  end

private
  def user_params
    params.require(:user).permit(:name, :leave_after, :leave_before, :destination_address, :has_car, :car_spots)
  end
end