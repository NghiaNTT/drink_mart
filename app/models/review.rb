class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :average_rate, ->(id_product){
    where product_id: id_product
  }
end
