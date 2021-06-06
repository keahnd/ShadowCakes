class OrdersController < ApplicationController

  before_action :set_order, only: %i[ show edit update destroy]

  def new
    @all_orders = Order.all
    @order = current_order
    @order.user_id = current_user.id
    @order.client_id = current_user.id
    @order.email = current_user.email
    @delivery_date = 3
    @addition_days = @all_orders.where(status: 'open').count * 2
    @delivery_date = 3 + @addition_days
  end

  def index
    @orders = Order.all
    @orders.each do |order|
      @time_diff = ((Time.now - order.created_at)/1.hour).round
      if order.payment_completed == false && order.order_delete_reminder == false && @time_diff >= 2
        order.order_delete_reminder = true
        order.save
        OrderMailer.payment_order_cancelled_shadow(order, order.user_id).deliver
      elsif order.payment_completed == false && order.payment_reminder == false && @time_diff >= 1
        order.payment_reminder = true
        order.save
        OrderMailer.payment_reminder_shadow(order, order.user_id).deliver
      end
    end
  end

  def show
    @order_items = @order.order_items
  end

  def edit
    @min_date = Date.today.year
    @max_date = Date.today + 3.days
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        if @order.payment_completed == true
          format.html { OrderMailer.payment_completed(@order, @order.user_id).deliver
          flash[:notice] = "Payment for order has been processed."
          redirect_to orders_path }
        elsif @order.status == "Ready for Pick Up" && (@order.pick_up_date.nil?)
          format.html { OrderMailer.update_order(@order, @order.user_id).deliver
          flash[:notice] = "Order has been updated."
          redirect_to orders_path }
        elsif !(@order.pick_up_date.nil?)
          format.html { OrderMailer.pick_up_order(@order, @order.user_id).deliver
          flash[:notice] = "Pick Up time has been set."
          redirect_to orders_path }
        else
          format.html { redirect_to @order, notice: "Order was successfully updated." }
          format.json { render :show, status: :ok, location: @order }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_payment_reminder
    @order = current_order
    @user = current_user

    OrderMailer.payment_reminder_user(@order, @user).deliver
    flash[:notice] = "Payment Reminder has been sent."
    redirect_to menu_path
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { OrderMailer.payment_order_cancelled_user(@order, @order.user_id).deliver
          flash[:notice] = "Order was successfully cancelled."
          redirect_to orders_path }
      format.json { head :no_content }
    end
  end

  def create
    @order_id = current_order.id
    @order = current_order
    @order.user_id = current_user.id
    @order.client_id = current_user.id
    @order.email = current_user.email

    if @order.update!(order_params.merge(status: 'open'))
      session[:order_id] = nil
      redirect_to send_order_mail_path
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_delete_reminder, :payment_reminder, :payment_completed, :first_name, :last_name, :user_id, :email, :status, :pick_up_date, :pick_up_time)
  end

end
