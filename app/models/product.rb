class Product < ApplicationRecord
  has_many :favorites
  has_many :reviews
  belongs_to :category
  has_many :cart_details

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
end
