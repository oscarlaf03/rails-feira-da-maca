class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = current_user.products
  end

  def show
    @questions = Question.where(product: @product)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to products_show_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product.delete
    redirect_to products_index
  end

  def update
    if @product.save
      redirect_to products_show_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:price, :model, :memory, :color, :status,
                                    :photo, :description, :category, :product_type,
                                    :version, :owner_id, :buyer_id)
  end


  def set_product
    @product = Product.find(params[:id])
  end




end
