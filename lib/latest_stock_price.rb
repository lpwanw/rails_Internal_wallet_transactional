# frozen_string_literal: true

module LatestStockPrice
  class << self
    attr_accessor :api_key

    def configure
      yield(self)
    end
  end
end
