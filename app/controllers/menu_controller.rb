class MenuController < ApplicationController
	before_action :set_cats
  def index
  	@page = 'menu';
  	@products = Product.all
    @order_item = current_order.order_items.new
  end

  def search
  	query = params[:search]

  	results = Product.where('name', "%#{query}%")
  	if params[:filter] == 'Select Filter'
  		@products = results
  	else
  		symbol = params[:filter].gsub(/ /, '_').downcase.to_sym
  		@prodcuts = results.where(symbol: true)
  	end

    respond_to do |format|
      format.js
    end
  end



  private

  def set_cats
  	@cats = Category.all.where(display: true)
  end
end
