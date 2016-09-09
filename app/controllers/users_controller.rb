class UsersController < ApplicationController
  before_action :authorize_admin!, except: [:show]

  def show
    if current_user.admin
      # @admin = current_user
      @user = User.find_by(id: params[:id] || current_user.id)
    else
      @user = current_user
    end
  end

  
end
