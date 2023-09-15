# frozen_string_literal: true

class LatestStockPrice::PriceAll < LatestStockPrice::Base
  class << self
    def get_price_all(identifier: nil)
      @identifier = identifier
      @response = send_request

      handle_response
    end

    private

    attr_reader :identifier

    def send_request
      Faraday.get("#{base_url}any") do |request|
        request.headers = headers
        request.params = params
      end
    end

    def params
      return {} if identifier.blank?

      {
        "Identifier" => identifier
      }
    end
  end
end
