class Restaurant < ApplicationRecord
  searchkick word_middle: [:name]
  acts_as_taggable_on :tags
end
