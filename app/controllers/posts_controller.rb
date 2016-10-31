class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @user = User.find_by(id: params[:id])
      @post = Post.create(
        text: params[:text],
        user_id: params[current_user.id]
    )

    Activity.create(
      user_id: current_user.id,
      event: 'created',
      recordable_type: "Post",
      recordable_id: @post.id
    )
    redirect_to '/'
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = Post.update(
    text: params[:text]
    )

    Activity.create(
      user_id: current_user.id,
      event: "updated",
      recordable_type: "Post",
      recordable_id: @post.id
    )
    redirect_to '/'
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    Activity.create(
      user_id: current_user.id,
      event: "deleted",
      recordable_type: "Post",
      recordable_id: @post.id
    )
    redirect_to '/'
  end
end
