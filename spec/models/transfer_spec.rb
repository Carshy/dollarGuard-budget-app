require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'Transfer model' do
    before(:each) do
      @user = User.create! name: 'Jamie', email: 'jamie@gmail.com', password: 'password'
      @category = Category.create! name: 'Lawie', icon: 'shorturl.at/nxQZ7', user: @user
      @transfer = Transfer.create! name: 'goat steak', amount: 14, author: @user
    end

    it 'creates a linking table' do
      transfer = Transfer.create! transfer_id: @transfer.id, category_id: @category.id
      expect(transfer).to be_valid
    end
  end
end
