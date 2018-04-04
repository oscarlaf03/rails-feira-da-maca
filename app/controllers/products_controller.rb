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
    @product.owner = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product)
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
