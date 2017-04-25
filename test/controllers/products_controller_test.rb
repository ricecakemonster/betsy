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
    get product_path(products(:cat_jacket))
    must_respond_with :success
  end

  it "returns a 404 if the product doesn't exist" do
    product_id = Product.last.id
    product_id += 1
    get product_path(product_id)

    must_respond_with :not_found
  end

  it "should get new" do
    session[:user_id] = merchants(:merchant_1).id
    get new_merchant_product_path(session[:user_id])
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
