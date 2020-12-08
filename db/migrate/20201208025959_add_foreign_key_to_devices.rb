class AddForeignKeyToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :user_id, :integer
  end
end
