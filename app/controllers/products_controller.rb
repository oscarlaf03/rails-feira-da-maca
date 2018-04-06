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
    set_standard_photo(@product)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def update
    if @product.update(product_params)
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

  def set_standard_photo(product_object)

    stock_photo = {
      'iPhone'=> 'iphone_geral.jpeg',
      'iPhone 3G' => 'iphone3g.jpeg',
      'iPhone 3GS' => 'iphone3gs.jpeg',
      'iPhone 4' => 'iphone4.png',
      'iPhone 4S' => 'iphone4s.jpeg',
      'iPhone 5' => 'iphone5.jpg',
      'iPhone 5C' => 'iphone5c.png',
      'iPhone 5S' => 'iphone5s.jpeg',
      'iPhone 6 / 6 Plus' => 'iphone6.jpeg',
      'iPhone 6S / 6S Plus' => 'iphone6s.jpeg',
      'iPhone SE' => 'iphonese.jpeg',
      'iPhone 7 / 7 Plus' => 'iphone7.jpeg',
      'iPhone 8 / 8 Plus' => 'iphone8.jpeg',
      'iPhone X' => 'iphonex.jpeg'
    }
    product_object.photo = stock_photo[product_object.category]
  end

end
