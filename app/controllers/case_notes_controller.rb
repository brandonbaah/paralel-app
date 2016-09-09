class CaseNotesController < ApplicationController

  def index
    @client = Client.find_by(id: params[:id])
    @case_notes = @client.case_notes
    render "index.html.erb"
  end

  def show
    @case_note = CaseNote.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    @client = Client.find_by(id: params[:id])
    render "new.html.erb"
  end

  def create
    @casenote = CaseNote.create(
      client_id: params[:id],
      date: params[:date],
      note: params[:note]
      )
      @client = Client.find_by(id: params[:id])
      @case_notes = @client.case_notes

      Activity.create(
        user_id: current_user.id,
        event: "created",
        recordable_type: "CaseNote",
        recordable_id: @casenote.client.id
      )
      flash[:success] = "Client: #{@client.name}'s case note was successfully created."
      redirect_to "/clients/#{@client.id}/casenotes"
  end

  def edit
    @casenote = CaseNote.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @casenote = CaseNote.find_by(id: params[:id])
    @casenote.update(
      client_id: params[:id],
      date: params[:date],
      note: params[:note]
    )
    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "CaseNote",
      recordable_id: @casenote.client.id
    )
      redirect_to "/clients/#{@casenote.client.id}/casenotes"
  end

  def destroy
    @casenote = CaseNote.find_by(id: params[:id])
    @casenote.destroy
    flash[:success] = "#{@client.name}'s case note was successfully deleted."
    render "/clients/#{@casenote.client.id}/casenotes"

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "CaseNote",
      recordable_id: @casenote.client.id
    )
  end
end
