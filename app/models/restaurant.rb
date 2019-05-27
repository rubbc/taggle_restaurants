class Restaurant < ApplicationRecord
  searchkick
  acts_as_taggable_on :tags
end
