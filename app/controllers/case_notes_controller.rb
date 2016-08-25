class CaseNotesController < ApplicationController

  # def index
  #   @casenotes = CaseNote.where(id: current_user.id)
  #   render "index.html.erb"
  # end
  #
  # def show
  #   @casenotes = CaseNote.find_by(id: client.id)
  #   render "show.html.erb"
  # end
  #
  # def new
  #   render "new.html.erb"
  # end
  #
  # def create
  #   @casenote = CaseNote.create(
  #     client_id: params[:id],
  #     date: params[:date],
  #     note: params[:note]
  #     )
  #   redirect_to "/client/#{@client.id}/index"
  # end
  #
  # def edit
  #   @casenote = CaseNote.find_by(id: params[:id])
  #   render "edit.html.erb"
  # end
  #
  # def update
  #   @casenote = CaseNote.find_by(id: params[:id])
  #   @casenote.update(
  #     client_id: params[:id],
  #     date: params[:date],
  #     note: params[:note]
  #   )
  #     redirect_to "/clients"
  # end
end
