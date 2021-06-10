class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  respond_to :html, :xml, :json

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @page = 'products'
    if @product.reviews.blank?
      @average_review = "N/A"
    else
      @average_review = @product.reviews.average(:rating).round(2)
    end
    @order_item = current_order.order_items.new
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.category = Category.find(1)
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product.category = Category.find(params[:product][:category_id])
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:sold_out, :name, :description, :price, :image, :category_id, :gluten_free, :dairy_free, :contains_peanuts, :featured, { sizes: [] }, :mult_size, {priceDiff: [] }, :feeds)
    end
end
