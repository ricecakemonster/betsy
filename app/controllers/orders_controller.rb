class OrdersController < ApplicationController
  before_action :find_order, only: [:added_to_cart, :cart]

  def index

  end

  def add_to_cart
    if session[:order_id]
      @order = Order.find_by(id: session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end

    @orderproduct = Orderproduct.create(orderproduct_params)

    if @orderproduct
      flash[:result_text] = "Successfully added to Cart"
      flash[:status] = :success
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Could not create a Cart"
      flash.now[:messages] = @order.errors.messages
      render :product, status: :bad_request
    end
    redirect_to product_orders_added_to_cart_path(product_id: params[:id])
  end

  def added_to_cart
  end

  def cart
  end

  def update_qty
    @order = Order.find_by(id: params[:id])
    @orderproduct = Orderproduct.find_by(id: params[:orderproduct][:id])
    @orderproduct.update(orderproduct_params)
    if @orderproduct.save
      redirect_to cart_path(id: params[:id])
    else
      render :cart, status: :bad_request
    end
  end

  def remove_from_cart
    @orderproduct = Orderproduct.find_by(id: params[:orderproduct_id])
    if @orderproduct.nil?
      head :not_found
    else
      @orderproduct.destroy
      redirect_to cart_path(id: params[:order_id])
    end
  end

  def checkout
    @order = Order.find_by(id: params[:id])
  end

  def purchase
    @order = Order.find_by(id: params[:id])
    address1 = params[:order][:mailing_address][:line1]
    address2 = params[:order][:mailing_address][:line2]
    @address = address1 + " " + address2
    @order.update(order_params)
    redirect_to invoice_path

  end

  def invoice
    @order = Order.find_by(id: params[:id])

  end



    # flash[:result_text] = "Continue shopping?"
    #  if @answer = "yes"
    #    redirect_to root_path
    #  else
    #    render "payment"
    #  end



    #     @order.buyer_id = session[:user_id] if session[:user_id] != nil
    #
    #
    #
    #       if params[:cc_num] && params[:cc_name] && params [:cc_expiry]
    #         @order.status = "paid"
    #         redirect_to orders_path
    #       else
    #         @order.status = "pending"
    #         render :payment
    #         flash[:result_text] = "Please enter Credit Card info to finalize the purchase!"
    #       end
    #     else
    #       flash[:status] = :failure
    #       flash[:result_text] = "Please enter Name and Address"
    #       flash[:messages] = @work.errors.messages
    #       render :new, status: :bad_request
    #     end
    #
    #
    #

  #
  #   def edit
  #   end
  #
  #   def update
  #   end
  #
  #   def destroy
  #   end
  #
  #   def purchase
  #
  # end
  #
  private

  def order_params
    return params.require(:order).permit(:status, :cc_num, :cc_name, :order_email, :cc_expiry, :buyer_id).merge(mailing_address: @address)
  end

  def orderproduct_params
    return params.require(:orderproduct).permit(:quantity, :product_id).merge(order_id: @order.id)
  end

  def find_order
    @order = Order.find(session[:order_id])
    @product = Product.find_by(id: params[:product_id])
    @order = Order.find_by(id: session[:order_id])
  end

end
