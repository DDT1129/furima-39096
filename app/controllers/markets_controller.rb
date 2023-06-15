class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_market, only: [:show, :edit, :update]

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

  def show
  end

  def edit
    return if current_user.id == @market.user_id

    redirect_to action: :index
  end

  def update
    if @market.update(market_params)
      redirect_to market_path
    else
      render :edit
    end
  end

  private

  def market_params
    params.require(:market).permit(:name, :explanation, :price, :category_id, :detail_id, :shipping_price_id, :shipping_date_id,
                                   :prefecture_id, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_market
    @market = Market.find(params[:id])
  end
end
