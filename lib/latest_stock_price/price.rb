# frozen_string_literal: true

class LatestStockPrice::Price < LatestStockPrice::Base
  class << self
    def get_price(indices:, identifier: nil)
      @indices = indices
      @identifier = identifier
      @response = send_request

      handle_response
    end

    private

    attr_reader :indices, :identifier

    def send_request
      Faraday.get("#{base_url}price") do |request|
        request.headers = headers
        request.params = params
      end
    end

    def params
      {
        "Identifier" => identifier,
        "Indices" => indices
      }
    end
  end
end
