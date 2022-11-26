require 'rails_helper'

RSpec.describe 'Transfers', type: :feature do
  describe 'GET transfers#new' do
    before(:each) do
      user = User.create name: 'jamie', email: 'jamie@gmail.com', password: 'password'

      visit new_user_session_path
      page.fill_in placeholder: 'Email', with: user.email
      page.fill_in placeholder: 'password', with: user.password
      click_button 'Next'
      visit new_transfer_path
    end

    it 'should have a name input field' do
      expect(page).to have_field('Name')
    end

    it 'should have a name input field' do
      expect(page).to have_field('Amount')
    end
  end
end
