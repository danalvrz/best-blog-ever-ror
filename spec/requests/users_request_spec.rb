require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'responds correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correctly' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('THIS IS THE LIST OF USERS')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1' }

    it 'responds correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correctly' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('THIS IS THE USER PAGE FOR A SPECIFIC USER, THEIR BIO, AND THEIR POSTS')
    end
  end
end
