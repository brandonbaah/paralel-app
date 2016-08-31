class CheckListsController < ApplicationController

  def index
    @checklists = CheckList.find_by(id: params[:id] || session[:id])
  end

  def create
    @checklist = CheckList.create(
    user_id: session[:user_id],
    client_id: params[:client_id],
    goal: params[:goal],
    status: "Pending"
    )
    flash[:success] = "New Task Created."
  end

end
