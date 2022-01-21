require 'rails_helper'
RSpec.describe 'Post', type: :model do
  describe 'title should not be blank' do
    it 'should return false to safe' do
      p = Post.new(title: '', text: 'lorem', comments_counter: 0, likes_counter: 0, user_id: 2)
      expect(p.valid?).to be_falsy
    end
  end
  describe 'comment counter should be greater than or equal to 0' do
    it 'should return false to safe' do
      p = Post.new(title: 'post', text: 'lorem', comments_counter: -5, likes_counter: 0, user_id: 2)
      expect(p.valid?).to be_falsy
    end
  end
  describe 'likes counter should be greater than or equal to 0' do
    it 'should return false to safe' do
      p = Post.new(title: 'post', text: 'lorem', comments_counter: 5, likes_counter: -5, user_id: 2)
      expect(p.valid?).to be_falsy
    end
  end
  # Testing method recent_comments
  describe 'Testing the amount of comments of a post' do
    it 'should return 5 or less comments to post 1' do
      expect(Post.find(1).recent_comments.count).to be <= 5
    end
  end
  # Testing method update_post_comments
  describe 'Testing the amount of post of a user' do
    # get the number of Posts before save new one of the first user
    total_posts = User.find(1).post_counter
    # submit the post
    post = Post.new(title: 'newest post', text: 'loremipsum...', comments_counter: 0, likes_counter: 0, user_id: 1)
    post.save
    # execute function to user one
    post.update_posts_counter(1)
    test_number = total_posts.to_i + 1
    it 'post should be total_comments + 1' do
      expect(User.find(1).post_counter).to eql(test_number)
    end
  end
end
