class PagesController < ApplicationController
  def home
    @products = Product.where(status: :Avaiable)
  end

  def sales
    @product = Product.find(params[:id])
  end

  def home_products
  end
end
