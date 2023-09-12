# frozen_string_literal: true

require "latest_stock_price"

LatestStockPrice.configure do |config|
  config.api_key = ENV.fetch("RAPID_API_KEY", nil)
end
