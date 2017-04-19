class Merchant < ApplicationRecord
  has_many :products
  has_many :orders, through: :
end
