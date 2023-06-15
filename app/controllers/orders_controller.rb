class OrdersController < ApplicationController
  
  def index
    @market = Market.find(params[:market_id])
    
    
  end

  def create
  end

end
