class MerchantsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find_by(id: params[:id])

    if @merchant
      @products = @merchant.products
    else
      head :not_found
    end
  end

  def edit
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    end
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.update_attributes(merchant_params)
    if @merchant.save
      redirect_to merchant_path(@merchant)
    else
      render :edit, status: :bad_request
    end
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

  def login
    auth_hash = request.env['omniauth.auth']

    merchant = Merchant.find_by(oauth_provider: params[:provider], oauth_uid: auth_hash["uid"])

    if merchant.nil?
      merchant = Merchant.from_github(auth_hash)
      if merchant.save
        session[:user_id] = merchant.id
        flash[:result_text] = "Successfully logged in as new merchant: #{merchant.username}"
      else
        raise
        flash[:result_text] = "Login unsuccessful"
        merchant.errors.messages.each do |field, problem|
          flash[:field] = problem.join(', ')
        end
      end
    else
      session[:user_id] = merchant.id
    end
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Successfully logged out"
    redirect_to root_path
  end


  private
  def merchant_params
    return params.require(:merchant).permit(:merchant_name, :merchant_email, :username)
  end
end
