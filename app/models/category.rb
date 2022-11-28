class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user
  has_one_attached :icon
  has_many :transfers, foreign_key: 'category_id', dependent: :destroy
end
