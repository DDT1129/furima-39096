class OrdersController < ApplicationController
  
  def index
    @market = Market.find(params[:market_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :house_umber, :building, :phone).merge(user_id: current_user.id)
  end
end
