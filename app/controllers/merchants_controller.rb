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
    raise
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
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update_attributes(merchant_params)
    merchant.save

    redirect_to merchants_path
  end

  def destroy
    merchant = Merchant.find(params[:id])
    if @current_user.id == merchant.id
      merchant.destroy
    else
      flash[:result_text] = "Sorry, you can only delete your own account."
    end
    redirect_to merchants_path
  end

  private
  def merchant_params
    return params.require(:merchant).permit(:merchant_name, :merchant_email, :username)
  end
end
