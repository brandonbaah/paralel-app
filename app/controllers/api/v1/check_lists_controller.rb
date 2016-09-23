class Api::V1::CheckListsController < ApplicationController

  def index
    @checklists = CheckList.find_by(id: params[:id] || session[:id])
  end

  def create
    @client_id = params[:client_id]
    @checklist = CheckList.create(
      user_id: current_user.id,
      client_id: @client_id,
      goal: params[:goal],
      complete: false
    )
    Activity.create(
      user_id: current_user.id,
      event: "created",
      recordable_type: "CheckList",
      recordable_id: @checklist.id
    )
    flash[:success] = "New Task Created."
    redirect_to "/clients/" + @client_id
  end

  def update
    @checklist = CheckList.update(
      user_id: session[:user_id],
      client_id: params[:client_id],
      goal: params[:goal],
      complete: params[:complete]
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
      recordable_type: "CheckList",
      recordable_id: @client.id
    )
end
end
