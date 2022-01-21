class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: params[:user_id], post_id: params[:id])
    if @like.save
      @like.update_likes_counter(params[:id])
      redirect_to post_details_path, flash: { like_added: 'Like added Successfully!' }
    else
      render notice: 'Unable to save like!'
    end
  end
end
