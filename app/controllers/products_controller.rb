class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]
  skip_after_action :verify_policy_scoped, only: [ :index ]


  def index
    @products = policy_scope(Product).where(owner: current_user)
  end

  def show
    @questions = Question.where(product: @product)
    authorize @questions
    @question = Question.new
    authorize @question


  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.owner = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
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
      :version, :owner_id, :buyer_id, :product_photo, :product_photo_cache)
  end


  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end
end
