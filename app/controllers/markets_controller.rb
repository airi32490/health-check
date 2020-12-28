class MarketsController < ApplicationController

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to top_healths_path
    else
      render :new
    end
  end

  private

  def market_params
    params.require(:market).permit(:nikkei, :ny_dow, :us_dollar, :euro, :au_dollar).merge(user_id: current_user.id)
  end
end
