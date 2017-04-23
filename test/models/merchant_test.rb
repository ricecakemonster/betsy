require "test_helper"

describe Merchant do

  describe "relationships" do
    it "can have many products" do

    end
  end

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

    it "can create a merchant with a merchant_email" do
      merchant = Merchant.create(merchant_email: "TestEmail")
      merchant.errors.messages.wont_include :merchant_email
    end

    it "is invalid without a merchant_email" do
      merchant = Merchant.new
      result = merchant.valid?
      result.must_equal false

      merchant.errors.messages.must_include :merchant_email
    end

    it "can create a merchant with a username" do
      merchant = Merchant.create(username: "TestUser")
      merchant.errors.messages.wont_include :username
    end

    it "is invalid without a username" do
      merchant = Merchant.new
      result = merchant.valid?
      result.must_equal false

      merchant.errors.messages.must_include :username
    end

    it "can create a merchant with a oauth_uid" do
      merchant = Merchant.create(oauth_uid: "11111")
      merchant.errors.messages.wont_include :oauth_uid
    end

    it "is invalid without a oauth_uid" do
      merchant = Merchant.new
      result = merchant.valid?
      result.must_equal false

      merchant.errors.messages.must_include :oauth_uid
    end

    it "can create a merchant with a oauth_provider" do
      merchant = Merchant.create(oauth_provider: "TestGithub")
      merchant.errors.messages.wont_include :oauth_provider
    end

    it "is invalid without a oauth_provider" do
      merchant = Merchant.new
      result = merchant.valid?
      result.must_equal false

      merchant.errors.messages.must_include :oauth_provider
    end
  end
end
