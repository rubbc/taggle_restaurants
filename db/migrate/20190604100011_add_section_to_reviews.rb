class AddSectionToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :section, :string
  end
end
