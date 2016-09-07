class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_user

  def update_staff_check_list
    @checklist = CheckList.find_by(id: params[:id])
  end

  def authorize_admin!
    unless current_user && current_user.admin
      flash[:warning] = "Not Authorized"
      redirect_to '/'
    end
  end
end
