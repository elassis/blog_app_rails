class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    #  render plain: params
    @current_user = current_user
    returned_values = comment_params
    returned_values.merge!(user_id: @current_user.id.to_s)
    @comment = @current_user.comment.new(returned_values)
    if @comment.save
      @comment.update_comment_counter(params[:id])
      redirect_to post_details_path, flash: { comment_added: 'Comment added Successfully!' }
    else
      redirect_to comments_create_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
    # params
  end
end
