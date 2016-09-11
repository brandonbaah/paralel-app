class CommentsController < ApplicationController
  def create
    @comment = Comment.create(
    text: params[:text],
    activity_id: params[:activity_id],
    user_id: current_user.id
    )
    redirect_to '/'
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
