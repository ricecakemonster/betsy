class MerchantsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    if @merchant.id != nil
      flash[:success] = "Success, your merchant account is created!"
      redirect_to root_path
    else
      flash[:failure] = "Sorry, your account was created unsuccessfully. Please try again."
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
  def merchant_params
    return params.require(:merchant).permit(:merchant_name, :merchant_email, :username)
  end
end
