class UsersController < ApplicationController
  layout "welcome", only: [:home]
  before_action :authorize_admin!, except: [:show]

  def home
  end

  def show
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    @actions = Activity.all.order(updated_at: :desc)
    if current_user.admin
      @users = Users.all
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

  def uncompleted_tasks
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length / current_user.check_lists.length) * 100
  end
end
