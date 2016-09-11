class PostsController < ApplicationController
  def create
    @post = Post.create(
    text: params[:text],
    user_id: params[current_user.id]
    )
    redirect_to '/'
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = Post.update(
    text: params[:text]
    )
    redirect_to '/'
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to '/'
  end
end
