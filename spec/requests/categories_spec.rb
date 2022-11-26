require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET categories#index' do
    before(:each) do
      user = User.create name: 'jamie', email: 'jamie@gmail.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get root_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it "should contain the 'CATEGORIES' header" do
      expect(response.body).to include('CATEGORIES')
    end
  end
  describe 'GET categories#show' do
    before(:each) do
      user = User.create name: 'Jamie', email: 'jamie@gmail.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      category = Category.create! name: 'Lawie', icon: 'shorturl.at/nxQZ7', user: user
      get category_path(category)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it "should render page contenting 'Food'" do
      expect(response.body).to include('DETAILS')
    end
    it 'should have a link to add a category' do
      expect(response.body).to include('/transfers/new')
    end
  end
end
