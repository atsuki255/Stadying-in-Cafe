class CreateCafeCommnets < ActiveRecord::Migration[5.2]
  def change
    create_table :cafe_commnets do |t|
      t.text :comment
      t.integer :user_id
      t.integer :cafe_id

      t.timestamps
    end
  end
end
