class PostsController < ApplicationController
  def index
    id = params[:user_id]
    @user = User.find(id)
    @posts = Post.includes(:user).where("user_id = #{id}").references(:user).limit(2)
  end

  def show
    id = params[:user_id]
    post_id = params[:id]
    @user = User.find(id)
    @post = Post.find(post_id)
    @comments = Comment.includes(:post).where("post_id = #{post_id}").references(:post)
  end
end
