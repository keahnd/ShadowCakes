class CartController < ApplicationController
	delegate :subtotal, to: :order

	def show
	  	@page = 'cart';
	  	@order = current_order
	  	@first_name = current_order.first_name
	  	if current_order.nil?
	  		@order_items = nil
	  	else	  	
	  		@order_items = current_order.order_items
	  	end
  	end

  	def send_order_mail
	  @order = Order.last
	  @user = current_user

	  OrderMailer.new_order(@order, @user).deliver
	  flash[:success] = "Order Confirmed."
	  redirect_to menu_path
	end

end
