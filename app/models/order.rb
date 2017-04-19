class Order < ApplicationRecord
  has_many :merchants, through: :merchants_orders
  has_many :products, through: :orders_products
end
