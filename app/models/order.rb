class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled), message: "%{value} is not a valid status."}
  has_many :products, through: :orderproducts
  has_many :orderproducts
  has_many :merchants, through: :products
end
