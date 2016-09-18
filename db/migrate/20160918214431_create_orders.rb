class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total_price
      t.integer :status
      t.text :shipping_address
      t.timestamps
    end
  end
end
