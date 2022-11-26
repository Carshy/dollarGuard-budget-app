require 'rails_helper'

RSpec.describe 'Transfers', type: :request do
  describe 'GET transfer#new' do
    before(:each) do
      user = User.create name: 'Jamie', email: 'jamie@gmail.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get new_transfers_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:new)
    end

    it 'should render the form for new transfer addition' do
      expect(response.body).to include('NEW TRANSFER')
    end
  end
end
