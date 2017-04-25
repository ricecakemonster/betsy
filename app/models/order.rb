class Order < ApplicationRecord
  has_many :products, through: :orderproducts
  has_many :orderproducts
  has_many :merchants, through: :products


  def subtotal
    quantities = self.orderproducts.map{|orderproduct| orderproduct[:quantity]}

    @subtotal = 0
    @prices = []
    self.orderproducts.each do |orderproduct|
      @prices << Product.find_by(id: orderproduct.product_id).price
    end
    @prices.zip(quantities).each do |price, quantity|
      @subtotal += price * quantity
    end
    return @subtotal
  end


end
