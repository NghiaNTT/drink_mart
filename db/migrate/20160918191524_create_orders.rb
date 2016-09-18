class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign: true
      t.float :total_pay
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
