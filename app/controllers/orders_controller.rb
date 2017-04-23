class OrdersController < ApplicationController

  def index

  end

  def show
    @product_names = []
    @prices = []
    @subtotal = 0
    session[:product_id].each do |product_id|
      @product_names << Product.find_by(id: product_id)[:product_name]
      price = Product.find_by(id: product_id)[:price]
      @prices << price
    end
    @prices.zip(session[:quantities]).each do |price, quantity|
      @subtotal += price * quantity
    end

  end

  def new
    @product = Product.find_by(id: params[:product_id])
    @order = Order.find_by(id: session[:order_id])

    @subtotal = 0
    prices = Product.where(id: session[:product_id]).map{|p| p[:price]}
    prices.zip(session[:quantities]).each do |price, quantity|
      @subtotal += price * quantity
    end


  end

  def update

  end

  def add_to_cart

    if session[:product_id]
      @order = Order.find_by(id: session[:order_id])

    else
      @order = Order.create
      session[:order_id] = @order.id
      session[:product_id] ||= []
      session[:quantities] ||= []

    end
    @orderproduct = Orderproduct.create(orderproduct_params)
    session[:product_id] << Product.find_by(id: params[:id]).id
    session[:quantities] << @orderproduct.quantity

    redirect_to product_orders_new_path(product_id: params[:id])
  end


  def create #coming from product side
    @order = Order.create
    @orderproduct = Orderproduct.create(order_id: @order.id, product_id: params[:product_id])
    flash[:result_text] = "Successfully created a Cart"

    redirect_to cart_path(@order.id)
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
  end
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
    return params.require(:order).permit(:status, :cc_num, :cc_name, :order_email, :mailing_address, :cc_expiry, :buyer_id)
  end

  def orderproduct_params
    return params.require(:orderproduct).permit(:quantity, :product_id).merge(order_id: @order.id)
  end

  # def produts
  #   orderproducts = Orderproduct.where(@order.id)
  #   @products = []
  #   orderproducts.each do |orderproduct|
  #     @products << Product.find_by(orderproduct.product_id)
  #   end
  #   return @products
  # end

  # def subtotal
  #   opquantities= @order.orderproducts
  #   products = @order.products
  #   opquantities.zip(products).each do |op, product|
  #     @subtotal += op.quantity * product.price
  #   end
  #   return @subtotal
  # end
end
