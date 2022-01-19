class PostsController < ApplicationController
  def index
    id = params[:user_id]
    @user = User.find(id)
    @posts = Post.includes(:user).where("user_id = #{id}").references(:user).limit(2).order(id: :desc)
  end

  def show
    id = params[:user_id]
    post_id = params[:id]
    @user = User.find(id)
    @post = Post.find(post_id)
    @comments = Comment.includes(:post).where("post_id = #{post_id}").references(:post)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(title: params[:title], text: params[:text], user_id: params[:user_id])
    if @new_post.save
      @new_post.update_posts_counter(params[:user_id])
      redirect_to root_path, notice: 'Post created succesfully!'
    else
      render :new
    end
  end
end
