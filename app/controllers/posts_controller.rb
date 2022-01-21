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
    @current_user = current_user
    returned_values = post_params
    returned_values.merge!(comments_counter: 0, likes_counter: 0, user_id: @current_user.id.to_s)
    @new_post = @current_user.post.new(returned_values)
    if @new_post.save
      @new_post.update_posts_counter(params[:user_id])
      redirect_to root_path, flash: { post_added: 'Post added Successfully!' }
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
