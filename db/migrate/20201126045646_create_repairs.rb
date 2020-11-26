class CreateRepairs < ActiveRecord::Migration[6.0]
  def change
    create_table :repairs do |t|
      t.datetime :repair_time
      t.integer :repair_cost
      t.text :repair_desc
      t.integer :tech_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
