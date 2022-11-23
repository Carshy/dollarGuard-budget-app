class Transfer < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user
  belongs_to :Category
end
