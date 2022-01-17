class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :like

  # method that update user's post_counter
  def update_posts_counter(user_id)
    total_post = Post.includes(:user).where("user_id = #{user_id}").references(:user).count
    User.find(user_id).update(post_counter: total_post)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    Comment.includes(:post).where("post_id = #{id}").references(:post).limit(5)
  end
end
