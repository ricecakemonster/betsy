class Merchant < ApplicationRecord
  has_many :products
  has_many :orders, through: :products
  # validates :merchant_name, presence: true
  validates :merchant_email, presence: true
  validates :username, presence: true

  def self.from_github(auth_hash)
    merchant = Merchant.new
    merchant.username = auth_hash["info"]["nickname"]
    # merchant.merchant_name = auth_hash["info"]["first_name"]
    merchant.merchant_email = auth_hash["info"]["email"]
    merchant.oauth_uid = auth_hash["uid"]
    merchant.oauth_provider = "github"
    return merchant
  end
end
