class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.order(:id)
    @clients = Client.where(user_id: current_user.id)
  end

  def show
    @client = Client.find_by(id: params[:id])
  end

  def visits
    @clients = Client.where(user_id: current_user.id, visit_today: true)
  end
end
