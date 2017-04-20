class Order < ApplicationRecord
  has_many :products, through: :orderproducts
  has_many :orderproducts
end
