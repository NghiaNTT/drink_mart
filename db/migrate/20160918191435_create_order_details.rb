class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end
