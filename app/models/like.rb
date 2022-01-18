class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # A method that updates the likes counter for a post.
  def update_likes_counter(post_id)
    total_likes = Like.includes(:post).where("post_id = #{post_id}").references(:post).count
    Post.find(post_id).update(likes_counter: total_likes)
  end
end
