class Product < ApplicationRecord
  belongs_to :merchant
  has_many :orders, through: :orderproducts
  has_many :orderproducts
  has_many :reviews
<<<<<<< HEAD
  validates :product_name, presence: true
  validates :price, presence: true
  validates :merchant_id, presence: true
  validates :stock, presence: true
=======

  def avg_rating
    avg = reviews.select('avg(reviews.rating) as avg_rating').take&.avg_rating
    unless avg.nil?
      return avg.round(2)
    else
      return nil
    end
  end
>>>>>>> master-1
end
