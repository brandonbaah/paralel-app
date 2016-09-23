class Api::V1::ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @clients = Client.order(:id)
    @clients = Client.where(user_id: current_user.id)
  end

  def show
    @client = Client.find_by(id: params[:id])
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
      render json: {success: "Successfully created"}
  end

  def visits
    @clients = Client.where(user_id: current_user.id, visit_today: true)
  end

  def visit_update
    @client = Client.find_by(id: params[:id])
    @client.visit_today = !@client.visit_today
    @client.save
    render json: {success: "Successfully Updated Visit"}
  end
end
