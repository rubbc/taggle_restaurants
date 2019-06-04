class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :price, presence: true
  validates :section, presence: true
end
