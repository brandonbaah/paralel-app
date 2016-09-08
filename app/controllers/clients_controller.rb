#Controller used to create manage clients
class ClientsController < ApplicationController
  def index
    @clients = Client.order(:id)
    @clients = Client.where(user_id: current_user.id)
    render "index.html.erb"
  end

  def show
    @client = Client.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @client = Client.create(
      name: params[:name],
      address: params[:address],
      birthdate: params[:birthdate],
      phone: params[:phone]
      )
      flash[:success] = "Client: #{@client.name} was successfully created."
    redirect_to "/clients"
  end

  def edit
    @client = Client.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @client = Client.find_by(id: params[:id])
    @client.update(
      name: params[:name],
      address: params[:address],
      birthdate: params[:birthdate],
      phone: params[:phone]
      )
      flash[:success] = "Client: #{@client.name} was successfully updated."

    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "Client",
      recordable_id: client.id
    )
      redirect_to "/clients"
  end

  def destroy
    @client = Client.find_by(id: params[:id])
    @client.destroy
    flash[:success] = "#{@client.name} was successfully deleted."
    render "/clients/#{@client.id}"
  end

  def forms
  end

end
