class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # method that update post's comments_counter
  def update_comment_counter(post_id)
    total_comment = Comment.includes(:post).where("post_id = #{post_id}").references(:post).count
    Post.find(post_id).update(comments_counter: total_comment)
  end

  # get the username of a comment
  def user_name(user_id)
    user = User.find(user_id)
    user.name
  end
end
