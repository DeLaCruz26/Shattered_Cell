class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :model
      t.integer :user_id
      t.integer :repair_id
    end
  end
end
