class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :repair_id
    end
  end
end
