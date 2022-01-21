require 'rails_helper'
RSpec.describe 'Comment', type: :model do
  c = Comment.new(text: 'lorem', user_id: 1, post_id: 1)
  describe 'testing the user_name function' do
    it 'should return the name of the user' do
      # get the name of the user with id one
      expect(c.user_name(1)).to eql(User.find(1).name)
    end
  end
  describe 'testing the update_comments_counter function' do
    it 'should return the name of the user' do
      # get post's comments before save
      comments = Post.find(1).comments_counter
      # save comment update the comments counter of post one
      c.save
      c.update_comment_counter(1)
      # compare to see if the function works and increased by one
      expect(Post.find(1).comments_counter).to eql(comments.to_i + 1)
    end
  end
end
