class MerchantsController < ApplicationController
    before_action :require_login, only: [:index, :show]

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    end
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    if @merchant.id != nil
      flash[:success] = "Success, your merchant account is created!"
      redirect_to merchants_path
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
