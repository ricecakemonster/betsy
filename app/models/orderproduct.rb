class Orderproduct < ApplicationRecord
  has_many :orders
  has_many :products
  validates :quantity, numericality: { greater_than: 0, only_integer: true, }
  validates :order_id, presence: true
  validates :product_id, presence: true
end
