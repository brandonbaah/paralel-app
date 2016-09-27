class Api::V1::ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @clients = Client.order(:id)
    @clients = Client.where(user_id: current_user.id)
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    render "index.json.jbuilder"
  end

  def show
    @client = Client.find_by(id: params[:id])
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    render "show.json.jbuilder"
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @client = Client.create(
      name: params[:name],
      address: params[:address],
      birthdate: params[:birthdate],
      phone: params[:phone],
      user_id: current_user.id,
      longitude: coordinates[0],
      latitude: coordinates[1],
      visit_today: false
      )

      activity = Activity.create(
        user_id: current_user.id,
        event: "created",
        recordable_type: "Client",
        recordable_id: @client.id
      )

      ActionCable.server.broadcast "live_feed",
        id: activity.id,
        event: activity.event,
        recordable_id: activity.recordable_id,
        recordable_type: activity.recordable_type,
        user_id: activity.user_id,
        updated_at: activity.updated_at,
        created_at: activity.created_at,
        display_text: activity.display_text,
        client_name: activity.channel_name,
        client_id: activity.channel_id,

        user_id: activity.user.id,
        first_name: activity.user.first_name,
        last_name: activity.user.last_name,
        email: activity.user.email,
        role_id: activity.user.role_id,
        admin: activity.user.admin,
        director_id: activity.user.director_id,
        supervisor_id: activity.user.supervisor_id

    render json: {success: "Successfully created"}
  end

  def edit
    @client = Client.find_by(id: params[:id])
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    render "edit.html.erb"
  end

  def update
    @client = Client.find_by(id: params[:id])
    coordinates = Geocoder.coordinates(params[:address])
    @client.update(
      name: params[:name],
      address: params[:address],
      birthdate: params[:birthdate],
      phone: params[:phone],
      user_id: current_user.id,
      longitude: coordinates[0],
      latitude: coordinates[1],
      )
    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "Client",
      recordable_id: @client.id
    )
    
    flash[:success] = "Client: #{@client.name} was successfully updated."
    render json: {success: "Successfully updated"}
  end

  def destroy
    @client = Client.find_by(id: params[:id])
    @client.destroy

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "Client",
      recordable_id: @client.id
    )
    render json: {success: "Successfully deleted"}
  end

  def client_maps
    @clients = Client.where(user_id: current_user.id)
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
  end

  def visits
    @clients = Client.where(user_id: current_user.id, visit_today: true)
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
  end

  def visit_update
    @client = Client.find_by(id: params[:id])
    @client.visit_today = !@client.visit_today
    @client.save
    render json: {success: "Successfully created"}
  end

  def trips
  end
end
