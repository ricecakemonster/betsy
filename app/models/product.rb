class Product < ApplicationRecord
  belongs_to :merchants
  has_many :orders, through: :orders_products
  has_many :reviews
end
