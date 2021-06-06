namespace :reminder do
	task :payment => [ :environment ] do
    	@orders = Order.all
    	@orders.each do |order|
    		@time_diff = ((Time.now - order.created_at)/1.hour).round
	        if order.payment_completed == false && @time_diff >= 2
	          OrderMailer.payment_order_cancelled_shadow(order, order.user_id).deliver
	        elsif order.payment_completed == false && @time_diff >= 1
	          OrderMailer.payment_reminder_shadow(order, order.user_id).deliver
	        end
    	end
    end
end
