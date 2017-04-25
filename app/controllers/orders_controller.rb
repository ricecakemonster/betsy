class OrdersController < ApplicationController

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
    redirect_to product_orders_added_to_cart_path(product_id: params[:id])
  end

  def added_to_cart
    @order = Order.find(session[:order_id])
    @product = Product.find_by(id: params[:product_id])
    @order = Order.find_by(id: session[:order_id])
    # quantities = @order.orderproducts.map{|orderproduct| orderproduct[:quantity]}


    # @subtotal = 0
    # @prices = []
    # @order.orderproducts.each do |orderproduct|
    #   @prices << Product.find_by(id: orderproduct.product_id).price
    # end

    # @prices.zip(quantities).each do |price, quantity|
    #   @subtotal += price * quantity
    # end
  end

  def show
    @order = Order.find(session[:order_id])

    @product = Product.find_by(id: params[:product_id])
    @order = Order.find_by(id: session[:order_id])
    # quantities = @order.orderproducts.map{|orderproduct| orderproduct[:quantity]}

    # @subtotal = 0
    # @prices = []
    # @order.orderproducts.each do |orderproduct|
    #   @prices << Product.find_by(id: orderproduct.product_id).price
    # end
    #
    # @prices.zip(quantities).each do |price, quantity|
    #   @subtotal += price * quantity
    # end
  end

  def update_qty
    @order = Order.find_by(id: params[:id])

    @orderproduct = Orderproduct.find_by(id: params[:orderproduct][:id])
    @orderproduct.update(orderproduct_params)
    redirect_to order_path(id: params[:id])
  end

  def destroy_orderproduct
    @orderproduct = Orderproduct.find_by(id: params[:orderproduct_id])
    @orderproduct.destroy
    redirect_to order_path(id: params[:order_id])

  end




  # def create #coming from product side
  #   @order = Order.new
  #   if @order.save
  #     flash[:result_text] = "Successfully created a Cart"
  #     flash[:status] = :success
  #     @orderproduct = Orderproduct.create(order_id: @order.id, product_id: params[:product_id])
  #     redirect_to cart_path(@order.id)
  #   else
  #     flash.now[:status] = :failure
  #     flash.now[:result_text] = "Could not create a Cart"
  #     flash.now[:messages] = @order.errors.messages
  #     render :new, status: :bad_request
  #   end
  # end





  def update

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
