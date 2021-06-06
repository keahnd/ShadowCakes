class UsersController < ApplicationController

	def index
		@page = 'menu';
		@orders = Order.all
	end

	def orders_new(order, user)
		@orders = Orders.new
		@current_order = order
	end
end
