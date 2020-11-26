class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :password_digest
      t.text :device

      t.timestamps
    end
  end
end
