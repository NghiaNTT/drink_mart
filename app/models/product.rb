class Product < ApplicationRecord
  has_many :favorites
  has_many :reviews
  belongs_to :category
  has_many :cart_details

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}

  scope :in_category, -> category_id do
    where category_id: category_id if category_id.present?
  end
end
