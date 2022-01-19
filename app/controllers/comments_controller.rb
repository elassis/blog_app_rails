class CommentsController < ActionController::Base
  def create
    @comment = Comment.new(text: params[:text], user_id: params[:user_id], post_id: params[:id])
    if @comment.save
      @comment.update_comment_counter(params[:id])
      redirect_to post_details_path
    else
      render notice: 'Something Went wrong'
    end
  end
end
