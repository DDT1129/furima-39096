class OrdersController < ApplicationController
  before_action :set_market, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :house_umber, :building, :phone).merge(
      user_id: current_user.id, market_id: params[:market_id]
    )
  end

  def set_market
    @market = Market.find(params[:market_id])
  end
end
