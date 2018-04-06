class PagesController < ApplicationController
  def home
    @products = Product.limit(9)
  end

  def sales
    @product = Product.find(params[:id])
  end

  def home_products
  end

  def load_more
    @products = Product.limit(9)
    respond_to do |format|
      format.js { render :load_more }
    end
  end

end

