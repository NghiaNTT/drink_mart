class CreateCartDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_details do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.timestamps
    end
  end
end
