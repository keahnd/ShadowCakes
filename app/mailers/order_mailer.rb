class OrderMailer < ApplicationMailer

	def new_order(order, user)
		@order = order
		@order_items = @order.order_items
		@user = user
		mail(to: ENV["shadowsCakesEmail"], subject: "You got a new order!")
	end

	def update_order(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: @user.email, subject: "Your order has been updated!")
	end

	def pick_up_order(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: ENV["shadowsCakesEmail"], subject: "Someones coming for a pick up!")
	end

	def payment_completed(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: @user.email, subject: "Payment Confirmed!")
	end

	def payment_reminder_user(order, user)
		@order = order
		@order_items = @order.order_items
		@user = user
		mail(to: @user.email, subject: "Please complete your payment for your order")
	end

	def payment_order_cancelled_user(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: @user.email, subject: "Your order has been cancelled since your payment was never completed")
	end

	def payment_reminder_shadow(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: ENV["shadowsCakesEmail"], subject: "12-h Payment has not been recieved for an order")
	end

	def payment_order_cancelled_shadow(order, user)
		@order = order
		@order_items = @order.order_items
		@user = User.find_by_id(user)
		mail(to: ENV["shadowsCakesEmail"], subject: "24-h Payment has not been recieved for an order")
	end
end
