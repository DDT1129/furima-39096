class MarketsController < ApplicationController
  def index
  end

  def new
    @market = Market.new
  end
end
