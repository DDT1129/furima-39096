class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @markets = Market.all.order('created_at DESC')
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def market_params
    params.require(:market).permit(:name, :explanation, :price, :category_id, :detail_id, :shipping_price_id, :shipping_date_id,
                                   :prefecture_id, :user_id, :image).merge(user_id: current_user.id)
  end
end
