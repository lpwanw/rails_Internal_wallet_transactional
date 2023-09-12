# frozen_string_literal: true

module LatestStockPrice
  class << self
    attr_accessor :api_key
  end

  def self.configure
    yield(self)
  end
end
