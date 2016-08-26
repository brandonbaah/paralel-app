class CaseNotesController < ApplicationController

  def index
    @client = Client.find_by(id: params[:id])
    @case_notes = @client.case_notes
    render "index.html.erb"
  end

  # def show
  #   @client = Client.find_by(id: params[:id])
  #   @case_notes = @client.case_notes
  #   render "show.html.erb"
  # end

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
      redirect_to "index.html.erb"
  end
#
#   def edit
#     @casenote = CaseNote.find_by(id: params[:id])
#     render "edit.html.erb"
#   end
#
#   def update
#     @casenote = CaseNote.find_by(id: params[:id])
#     @casenote.update(
#       client_id: params[:id],
#       date: params[:date],
#       note: params[:note]
#     )
#       redirect_to "/clients"
#   end
end
