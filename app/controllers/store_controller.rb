class StoreController < ApplicationController
  def index
     @products = Product.where(stock_status: 'new' )

  end

  def used
    @products = Product.where(stock_status: 'used')
  end

  def most_wanted

  end

  def join

  end

end
