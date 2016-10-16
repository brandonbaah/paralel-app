class Api::V1::CheckListsController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @checklists = CheckList.all
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
    render "index.json.jbuilder"
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
    render "index.json.jbuilder"
  end

  def destroy
    @client = Checklist.find_by(id: params[:id])
    @client.destroy
    flash[:success] = "#{@client.name}'s goal was successfully deleted."

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "CheckList",
      recordable_id: @client.id
    )
    render "index.json.jbuilder"
  end
end
