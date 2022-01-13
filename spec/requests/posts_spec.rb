require 'rails_helper'
RSpec.describe 'UsersController', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) { get('/users/1/posts') }
    it 'Gets an ok http status response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'includes the right placeholder' do
      expect(response.body).to include("Show list of every user's post")
    end
  end
  describe 'GET /user' do
    before(:each) { get('/users/1/posts/1') }
    it 'Gets an ok http status response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template('show')
    end
    it 'includes the right placeholder' do
      expect(response.body).to include("Show data of user's specific post")
    end
  end
end
