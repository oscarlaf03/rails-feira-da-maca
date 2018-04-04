class PagesController < ApplicationController
  def home
    @products = Product.where(status: :Avaiable)
  end
end
