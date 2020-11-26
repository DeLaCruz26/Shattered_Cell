class CreateTeches < ActiveRecord::Migration[6.0]
  def change
    create_table :teches do |t|
      t.string :name
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
