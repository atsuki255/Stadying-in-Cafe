class AddReviewToCaves < ActiveRecord::Migration[5.2]
  def change
    add_column :caves, :review, :float
  end
end
