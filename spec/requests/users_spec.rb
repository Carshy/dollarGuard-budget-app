require 'rails_helper'

RSpec.describe 'User request', type: :request do
  context 'Home' do
    before(:example) { get root_path }

    it 'Home page success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Home page render template' do
      expect(response).to render_template('homes/index')
    end

    it 'Home page have content' do
      expect(response.body).to include('Welcome to Dollar-Guard Budget App')
    end
  end
end
