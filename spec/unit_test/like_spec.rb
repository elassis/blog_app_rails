require 'rails_helper'
RSpec.describe 'Comment', type: :model do
  l = Like.new(user_id: 1, post_id: 1)
  describe 'testing the update_like_counter function' do
    # get the number of likes
    likes = Post.find(1).likes_counter
    # save and run function for post one
    l.save
    l.update_likes_counter(1)
    it 'should return equal number of likes' do
      expect(Post.find(1).likes_counter).to eql(likes.to_i + 1)
    end
  end
end
