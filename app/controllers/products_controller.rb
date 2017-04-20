class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find_by(id: params[:id])
  end

  def new
  end

  rider = Rider.find(params[:rider_id])
  trip_info = {
    rider_id: rider.id,
    driver_id: 2,
    date: "Right freaking now",
    rating: trip_params[:rating],
    cost: rand(1.0..50.0)
  }

  @trip = rider.trips.build(trip_info)
  if @trip.save
    redirect_to trip_path(@trip.id)
    # else
    render :new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    @product = {
      merchant_id :merchant_id
      :



    }
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
