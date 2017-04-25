class ProductsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @orderproduct = Orderproduct.new
    @review = Review.new
    @review_list = Review.where(product_id: params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @product = Product.new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    product_data = {
      product_name: product_params[:product_name],
      price: product_params[:price],
      merchant_id: merchant.id,
      photo_url: product_params[:photo_url],
      product_description: product_params[:product_description]
    }
    @product = Product.new(product_data)
    if @product.save
      flash[:status] = :success
      flash[:result_text] = "Successfully added #{@product.product_name} to inventory"
      redirect_to products_path
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not create #{@product.product_name}"
      flash[:messages] = @product.errors.messages
      render :new, status: :bad_request
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  def review
    flash[:status] = :failure
    product = Product.find_by(id: params[:id])
    if @current_user.nil? || @current_user.id != product.merchant_id
      review_info = {
        product_id: product.id,
        rating: review_params[:rating],
        nickname: review_params[:nickname],
        review_description: review_params[:review_description]
      }
      @review = Review.new(review_info)
      if @review.save
        flash[:status] = :success
        flash[:result_text] = "Successfully reviewed!"
        redirect_to product_path(product.id)
      else
        flash[:result_text] = "Could not review"
        flash[:messages] = review.errors.messages
        render :new
      end
    else
      flash[:result_text] = "You cannot review your own product."
      redirect_to product_path(product.id)
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price, :merchant_id, :photo_url, :stock, :product_description)
  end

  def review_params
    params.require(:review).permit(:rating, :nickname, :review_description)
  end
end
