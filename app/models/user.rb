class User < ActiveRecord::Base
  has_many :post
  has_many :comment
  has_many :like
  def recent_posts
    Post.includes(:user).where("user_id = #{id}").references(:user).limit(3)
  end
end
