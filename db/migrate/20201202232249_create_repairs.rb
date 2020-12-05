class CreateRepairs < ActiveRecord::Migration[6.0]
  def change
    create_table :repairs do |t|
      t.datetime :repair_time
      t.text :repair_description
      t.integer :user_id
      t.integer :device_id
    end
  end
end
