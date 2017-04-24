class ProductsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @orderproduct = Orderproduct.new

  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @product = @merchant.products.build
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    @product = @merchant.products.build(product_params)
    # {
    #   merchant_id :merchant_id
    #   :
    # }
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

private
  def product_params
    params.require(:product).permit(:product_name, :price, :merchant_id, :photo_url, :stock, :product_description)
  end
end
