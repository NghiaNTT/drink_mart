class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role, default: 1
      t.string :avatar
      t.timestamps
    end
    add_index :users, :avatar
  end
end
