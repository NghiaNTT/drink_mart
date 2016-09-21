class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :update_total_price

  scope :order_number, -> order {where order_id: order.id}

  private
  def update_total_price
    total = 0
    LineItem.order_number(order).each do |line_item|
      product = line_item.product
      new_quantity = product.quantity - line_item.each_quantity
      product.update_attribute :quantity, new_quantity
      total += (line_item.each_quantity * product.price)
    end
    order.update_attribute :total_price, total
  end
end
