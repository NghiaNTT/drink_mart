class User < ApplicationRecord
  has_many :carts
  has_many :requests
  has_many :favorites
  has_many :reviews

  validates :name, presence: true, length: {maximum: 20},
    uniqueness: {case_sensitive: false}
  enum role: [:admin, :member, :guest]
end
