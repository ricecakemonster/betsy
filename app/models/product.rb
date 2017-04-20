class Product < ApplicationRecord
  belongs_to :merchant
  has_many :orders, through: :orderproducts
  has_many :orderproducts
  has_many :reviews
end
