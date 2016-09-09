class CheckListsController < ApplicationController

  def index
    @checklists = CheckList.find_by(id: params[:id] || session[:id])
  end

  def create
    @checklist = CheckList.create(
      user_id: current_user.id,
      client_id: params[:client_id],
      goal: params[:goal],
      status: "Pending"
    )
    Activity.create(
      user_id: current_user.id,
      event: "created",
      recordable_type: "CheckList",
      recordable_id: @client.id
    )
    flash[:success] = "New Task Created."
  end

  def update
    @checklist = CheckList.update(
      user_id: session[:user_id],
      client_id: params[:client_id],
      goal: params[:goal],
      status: "Pending"
    )
    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "CheckList",
      recordable_id: @client.id
    )
    flash[:success] = "Checklist Updated."
  end

  def destroy
    @client = Checklist.find_by(id: params[:id])
    @client.destroy
    flash[:success] = "#{@client.name}'s goal was successfully deleted."
    render "/clients/#{@client.id}"

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "Client",
      recordable_id: @client.id
    )

  end
end
