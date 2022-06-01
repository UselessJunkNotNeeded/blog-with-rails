require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'Check for respeonse code as 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows correct view' do
      expect(response).to render_template(:index)
    end
    
    it 'Check for the response body' do
      expect(response.body).to include('All the posts will be displayed here')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get'/users/1/posts/1'
    end
    it 'Check for response code as 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'check for the response body' do
      expect(response.body).to include('A particlular post will be shown here')
    end

    it 'shows correct view' do
      expect(response).to render_template(:show)
    end
  end
end
