class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.all
    render 'index.json.jbuilder'
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @comment = Comment.create(
    text: params[:text],
    activity_id: params[:activity_id],
    user_id: current_user.id
    )
    render 'show.json.jbuilder'
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment = Comment.update(
      text: params[:text],
      activity_id: params[:activity_id],
      user_id: params[:user_id]
    )
    redirect_to '/'
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end
end
