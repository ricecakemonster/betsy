require "test_helper"

describe ProductsController do
  describe "index" do
    it "should get index" do
      get products_path
      must_respond_with :success
    end

    it "succeeds when there are no products" do
      Product.destroy_all
      get products_path
      must_respond_with :success
    end
  end

  describe "show" do
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
  end

  describe "new" do
    it "should get new" do
      @current_user = merchants(:merchant_1)
      get new_product_path
      must_respond_with :success
    end
  end

  describe "create" do
    let(:dog_jacket) {{
      product: {
        product_name: "Dog Jacket",
        price: 19.99,
        merchant_id: Merchant.first.id,
        photo_url: "http://pinxpets.com/cat-rain-jacket/",
        stock: 5,
        product_description: "soooo waterproof but not breathable; mild activity only"}
        }}

        it "should get create" do
          @current_user = merchants(:merchant_1)
          post products_path, params: dog_jacket
          must_redirect_to  products_path
        end

        it "renders the form if invalid input " do
          @current_user = merchants(:merchant_1)
          dog_jacket[:price] = nil
          post products_path, params: dog_jacket
          must_respond_with :bad_request
        end

        it "adds a new user to the database " do
          before = Product.all.size
          @current_user = merchants(:merchant_1)
          dog_jacket[:price] = nil
          post products_path, params: dog_jacket
          Product.all.size.must_equal before + 1
        end
      end



      describe "edit" do
        it "succeeds for an extant work ID" do
          get edit_product_path(Product.last.id)
          must_respond_with :success
        end

        it "renders 404 not_found for a bogus work ID" do
          bogus_product_id = Product.last.id + 1
          get edit_product_path(bogus_product_id)
          must_respond_with :not_found
        end
      end

      describe "update" do
        it "adds work to database and redirects" do
          product = Product.find_by(product_name: "Cat Jacket")

          patch product_path(product), params: {product: {product_name: "UPDATED!" } }

          products(:cat_jacket).product_name.must_equal "UPDATED!"

          must_respond_with :redirect

        end
      end

      describe "destroy" do
        it "should get destroy" do
          get products_destroy_url
          must_respond_with :success
        end
      end

    end
