class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.string :shop_name
      t.text :impression
      t.integer :user_id

      t.timestamps
    end
  end
end
