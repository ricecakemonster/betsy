class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    merchant = Merchant.from_github(auth_hash)

    merchant = Merchant.find_by(oauth_provider: params[:provider], oauth_uid: auth_hash["uid"])
    if merchant.nil?
      # Don't know this merchant, build a new merchant
      merchant = Merchant.from_github(auth_hash)
      if merchant.save
        session[:user_id] = merchant.id
        flash[:result_text] = "Successfully logged in as new merchant: #{merchant.username}"
      else
        flash[:result_text] = "Login unsuccessful"
        merchant.errors.messages.each do |field, problem|
          flash[:field] = problem.join(', ')
        end
      end
    else
      session[:user_id] = merchant.id
      flash[:result_text] = "Welcome back, #{merchant.merchant_name}!"
    end
    redirect_to root_path
  end
end
