class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign: true
      t.float :total_pay
      t.integer :status
      t.timestamps
    end
  end
end
