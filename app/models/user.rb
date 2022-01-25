class User < ActiveRecord::Base
  has_many :post
  has_many :comment
  has_many :like
  validates :name, presence: true
  validates :post_counter, presence: false, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    Post.includes(:user).where("user_id = #{id}").references(:user).limit(3)
  end
end
