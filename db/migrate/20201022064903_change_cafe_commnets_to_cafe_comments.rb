class ChangeCafeCommnetsToCafeComments < ActiveRecord::Migration[5.2]
  def change
  	rename_table :cafe_commnets, :cafe_comments
  end
end
