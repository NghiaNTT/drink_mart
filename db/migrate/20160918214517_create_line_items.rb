class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :product_name
      t.float :each_total_price
      t.integer :each_quantity
      t.timestamps
    end
  end
end
