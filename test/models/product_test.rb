require "test_helper"

describe Product do
  describe "validations" do
    it "creates product with product_name" do
      product = Product.create(product_name: "Isabelle's Raincoat")
      product.errors.messages.wont_include :product_name
    end

    it "is invalid without a product name" do
      product = Product.new
      result = product.valid?
      result.must_equal false

      product.errors.messages.must_include :product_name
    end

    it "creates product with price" do
      product = Product.create(price: 20.95)
      product.errors.messages.wont_include :price
    end

    it "is invalid without a price" do
      product = Product.new
      result = product.valid?
      result.must_equal false

      product.errors.messages.must_include :price
    end

    it "creates product with a merchant_id" do
      product = Product.create(merchant_id: 1)
      product.errors.messages.wont_include :merchant_id
    end

    it "is invalid without a merchant_id" do
      product = Product.new
      result = product.valid?
      result.must_equal false

      product.errors.messages.must_include :merchant_id
    end

    it "creates product with a stock value" do
      product = Product.create(stock: 5)
      product.errors.messages.wont_include :stock
    end

    it "is invalid without a stock value" do
      product = Product.new
      result = product.valid?
      result.must_equal false

      product.errors.messages.must_include :stock
    end
  end

  describe "associations" do


  end
end
