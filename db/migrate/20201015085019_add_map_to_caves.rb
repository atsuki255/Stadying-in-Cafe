class AddMapToCaves < ActiveRecord::Migration[5.2]
  def change
    add_column :caves, :address, :string
    add_column :caves, :latitude, :float
    add_column :caves, :longitude, :float
  end
end
