class Api::V1::UsersController < ApplicationController
  def show
    @activities = Activity.all
    if current_user.admin
      # @admin = current_user
      @user = User.find_by(id: params[:id] || current_user.id)
    else
      @user = current_user
    end
  end

  def update
    @user = current_user
    @user = User.update(
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "User",
      recordable_id: current_user.id
    )
    flash[:success] = "#{@user.first_name}, your profile was successfully updated."
    redirect_to "/"
  end
end
