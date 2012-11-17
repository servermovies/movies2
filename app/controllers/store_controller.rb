class StoreController < ApplicationController
  def index
     @products = Product.where(stock_status:'new' )
     @cart = current_cart

  end

  def used
    @products = Product.where(stock_status: 'used')
    @cart = current_cart
  end

  def most_wanted
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
  end



  def join

  end

end
