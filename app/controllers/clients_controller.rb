#Controller used to create manage clients
class ClientsController < ApplicationController
  def index
    @clients = Client.all
    render "index.html.erb"
  end

  def show
    @client = Client.find_by(id: params[:id])
    render "show.html.erb"
  end
end
