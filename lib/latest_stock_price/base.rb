# frozen_string_literal: true

class LatestStockPrice::Base
  class << self
    private

    def headers
      {
        "X-RapidAPI-Host" => "latest-stock-price.p.rapidapi.com",
        "X-RapidAPI-Key" => LatestStockPrice.api_key
      }
    end

    def base_url
      "https://latest-stock-price.p.rapidapi.com/"
    end

    def response_body
      @response_body ||= JSON.parse(@response.body).map do |item|
        item.deep_transform_keys(&:underscore).with_indifferent_access
      end
    end

    def handle_response
      return handle_success if @response.success?

      # TODO: implement lib/latest_stock_price/error.rb
      raise StandardError
    end

    def handle_success
      response_body.map do |item_response|
        LatestStockPrice::Model::Stock.new(item_response)
      end
    end
  end
end
