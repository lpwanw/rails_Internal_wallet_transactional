# frozen_string_literal: true

require "rails/generators"

module LatestStockPrice
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_initializer
        template "initializer.rb", "config/initializers/latest_stock_price.rb"
      end
    end
  end
end
