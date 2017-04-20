require "test_helper"

describe Merchant do
  describe "validations" do
    it "can create a merchant with a merchant_name" do
      merchant = Merchant.create(merchant_name: "Isabelle")
      merchant.errors.messages.wont_include :merchant_name
    end

    it "is invalid without a merchant_name" do
      merchant = Merchant.new
      result = merchant.valid?
      result.must_equal false

      merchant.errors.messages.must_include :merchant_name
    end
  end
end
