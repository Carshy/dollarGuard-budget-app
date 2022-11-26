require 'rails_helper'

RSpec.describe 'Transfers', type: :feature do
  describe 'GET transfers#new' do
    before(:each) do
      transfer = Transfer.create name: 'puppie', amount: 12

      visit categories_path
      page.fill_in placeholder: 'Name', with: transfer.name
      page.fill_in placeholder: 'Amount', with: transfer.amount
      click_button 'Save'
      visit category_path
    end

    it 'should have a name input field' do
      expect(page).not_to have_field('Name')
    end

    it 'should have a name input field' do
      expect(page).not_to have_field('Amount')
    end
  end
end
