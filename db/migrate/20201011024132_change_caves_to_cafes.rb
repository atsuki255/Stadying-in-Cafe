class ChangeCavesToCafes < ActiveRecord::Migration[5.2]
  def change
  	rename_table :caves, :cafes
  end
end
