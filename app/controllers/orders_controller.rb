class OrdersController < ApplicationController
  def index

  end

  def show

  end

  def new
    @order = Order.new
  end

  def create #coming from product side
    @order = Order.create

    @orderproduct = Orderproduct.new(order: @order, product_id: params[:product_id])
    flash[:result_text] = "Successfully created a Cart"
    flash[:result_text] = "Continue shopping?"
     if @answer = "yes"
       redirect_to root_path
     else
       render "payment"
     end



    @order.buyer_id = session[:user_id] if session[:user_id] != nil



      if params[:cc_num] && params[:cc_name] && params [:cc_expiry]
        @order.status = "paid"
        redirect_to orders_path
      else
        @order.status = "pending"
        render :payment
        flash[:result_text] = "Please enter Credit Card info to finalize the purchase!"
      end
    else
      flash[:status] = :failure
      flash[:result_text] = "Please enter Name and Address"
      flash[:messages] = @work.errors.messages
      render :new, status: :bad_request
    end



  end

  def edit
  end

  def update
  end

  def destroy
  end

  def purchase

end

private

def order_params
  return params.require(:order).permit(:status, :cc_num, :cc_name, :order_email, :mailing_address, :cc_expiry, :buyer_id)
end

def orderproduct_params
  return params.require(:orderproduct).permit(:product_id, @order_id, :quantity)
end
