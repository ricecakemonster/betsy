require "test_helper"

describe ProductsController do
  it "should get index" do
    get products_path
    must_respond_with :success
  end

  it "succeeds when there are no products" do
    Product.destroy_all
      get products_path
      must_respond_with :success
  end

  it "should get show" do
    get product_path
    must_respond_with :success
  end

  it "should get new" do
    get new_product_path
    must_respond_with :success
  end

  it "should get create" do
    post post_product_path
    must_respond_with :success
  end

  it "should get edit" do
    get products_edit_url
    must_respond_with :success
  end

  it "should get update" do
    get products_update_url
    must_respond_with :success
  end

  it "should get destroy" do
    get products_destroy_url
    must_respond_with :success
  end

end
