class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    @product = .new(products_param)
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
end
