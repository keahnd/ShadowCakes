# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
	def new_order_email
		# Set up a temporary order for the preview
		order = @order_items.new(product_id: "1", quantity: "1")

		OrderMailer.with(order: order).new_order_email
	end
end
