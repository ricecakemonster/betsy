class Order < ApplicationRecord
  has_many :products, through: :orderproducts
  has_many :orderproducts
  has_many :merchants, through: :products


end
