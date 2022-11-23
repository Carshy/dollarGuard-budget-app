class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user
  has_many :transfers, dependent: :destroy
end