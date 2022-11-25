class Transfer < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category, foreign_key: 'category_id'
end
