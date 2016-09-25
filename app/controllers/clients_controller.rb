#Controller used to create manage clients
class ClientsController < ApplicationController
  def index
    @clients = Client.order(:id)
    @clients = Client.where(user_id: current_user.id)
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    render "index.html.erb"
  end

  def show
    @client = Client.find_by(id: params[:id])
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
    @percentage = (CheckList.where(user_id: current_user.id, complete: true).length.to_f / current_user.check_lists.length.to_f) * 100
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
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

      Activity.create(
        user_id: current_user.id,
        event: "created",
        recordable_type: "Client",
        recordable_id: @client.id
      )

      ActionCable.server.broadcast "live_feed",
      

    flash[:success] = "Client: #{@client.name} was successfully created."
    redirect_to "/clients"
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
    redirect_to "/clients"
  end

  def destroy
    @client = Client.find_by(id: params[:id])
    @client.destroy
    flash[:success] = "#{@client.name} was successfully deleted."
    render "/clients/#{@client.id}"

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "Client",
      recordable_id: @client.id
    )
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
    redirect_to "/clients"
  end

  def trips
  end
end
