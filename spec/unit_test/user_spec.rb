require 'rails_helper'
RSpec.describe 'User', type: :model do
  describe 'name not set' do
    it 'name should not valid to safe' do
      u_test_one = User.new(name: '', post_counter: 5)
      expect(u_test_one.valid?).to be_falsy
    end
  end
  describe 'comment counter less than zero' do
    u_test_two = User.new(name: 'peter', post_counter: -5)
    it 'comments_counter should not valid to safe' do
      expect(u_test_two.valid?).to be_falsy
    end
  end
  describe 'comment counter to string' do
    u_test_three = User.new(name: 'peter', post_counter: 'hello')
    it 'comments_counter should not valid to safe' do
      expect(u_test_three.valid?).to be_falsy
    end
  end
  describe 'testing recent_post function' do
    it 'return no more than 3 post' do
      expect(User.find(1).recent_posts.count).to be <= 3
    end
  end
end
