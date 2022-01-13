require 'rails_helper'
RSpec.describe 'UsersController', type: :request do
  describe 'GET /index' do
    before(:each) { get('/users') }
    it 'Gets an ok http status response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'includes the right placeholder' do
      expect(response.body).to include('Show a list of all the users')
    end
  end
  describe 'GET /user' do
    before(:each) { get('/users/1') }
    it 'Gets an ok http status response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template('show')
    end
    it 'includes the right placeholder' do
      expect(response.body).to include('html to show specific user data')
    end
  end
end
