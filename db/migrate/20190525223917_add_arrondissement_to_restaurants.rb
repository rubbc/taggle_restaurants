class AddArrondissementToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :arrondissement, :integeer
  end
end
