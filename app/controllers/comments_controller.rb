class CommentsController < ApplicationController
  def new
    @comment = Comment.create(
    text: params[:text],
    activity_id: params[:activity_id],
    user_id: params[:user_id]
    )
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment = Comment.update(
      text: params[:text],
      activity_id: params[:activity_id],
      user_id: params[:user_id]
    )
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end
end
