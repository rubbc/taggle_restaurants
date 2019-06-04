class Restaurant < ApplicationRecord
  has_many :food_items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  searchkick
  acts_as_taggable_on :tags, :arrondissements
end


