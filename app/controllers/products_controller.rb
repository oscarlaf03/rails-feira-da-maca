class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @questions = Question.where(product: @product)
  end
end
