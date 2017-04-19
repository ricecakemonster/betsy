class Order < ApplicationRecord
  has_many :merchants, through: :merchants_orders
  has_many :products, through: :orders_products
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled), message: "%{value} is not a valid status."}
  validates :cc_num, presence: true
  validates :cc_name, presence: true
  validates :order_email, presence: true
  validates :mailing_address, presence: true
  validates :cc_expiry, presence: true
end
