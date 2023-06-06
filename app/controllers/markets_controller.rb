class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @market = Market.new
  end
  
  def create
    
  
  end
  
  private

  def market_params
    params.require(:market).permit(:name, :explanation, :price, :category_id, :detail_id, :shipping_date_id, :prefecture_id, :user_id, :image).merge(user_id: current_user.id)
  end
end
