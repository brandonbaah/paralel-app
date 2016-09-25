class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @posts = Post.all
  end

  def create
    @user = User.find_by(id: params[:id])
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
