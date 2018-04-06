class PagesController < ApplicationController
  def home
    @products = Product.limit(6)
  end

  def sales
    @product = Product.find(params[:id])
  end

  def home_products
    @products = Product.where(sold: false).limit(6)
    if params[:product_type]
      @products = @products.where(product_type: params[:product_type])
    end
  end

  def load_more
    @products = Product.limit(9)
    respond_to do |format|
      format.js { render :load_more }
    end
  end

end

