class MarketsController < ApplicationController

  before_action :search_market, only: [:search, :result]

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

  def search
    @markets = Market.all
  end

  def result
    @results = @m.result
  end

  def stock_graph
    make_graph
    @comments = Comment.all.order(id: "DESC")
  end

  def exchange_graph
    make_graph
    @comments = Comment.all.order(id: "DESC")
  end

  private

  def market_params
    params.require(:market).permit(:nikkei, :ny_dow, :us_dollar, :euro, :au_dollar).merge(user_id: current_user.id)
  end

  def search_market
    @m = Market.ransack(params[:q])
  end

  def make_graph
    # 半年分のデータを取得
    @data = Market.limit(31*6).order(created_at: :desc).pluck(:created_at, params[:column])
    @price = Market.limit(31*6).order(created_at: :desc).pluck(params[:column])
  end
end
