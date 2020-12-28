class MarketsController < ApplicationController
  def new
    @market = Market.new
  end
end
