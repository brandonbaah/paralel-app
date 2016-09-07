class UsersController < ApplicationController
  before_action :authorize_admin!, except: [:show]

  def show
    if current_user.admin
      @user = User.find_by(id: params[:id])
    else
      @user = current_user
    end
                                                                  #     if @user.supervisor
                                                                  #       @boss = @user.supervisor.first_name
                                                                  #     elsif @user.director
                                                                  #       @boss = @user.director.first_name
                                                                  #     else
                                                                  #       @boss = ""
                                                                  #     end
    end
end
