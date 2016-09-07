class UsersController < ApplicationController
  before_action :authorize_admin!, except: [:show]

  def show
    if current_user.admin
      @user = User.find_by(id: params[:id])
    else
      @user = current_user
    end                                                
  end
end
