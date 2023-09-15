# frozen_string_literal: true

require "rails_helper"

RSpec.describe LatestStockPrice::PriceAll do
  describe ".get_price" do
    subject { described_class.get_price_all(identifier:) }

    let(:identifier) { "NIFTY 50" }
    let(:headers) do
      {
        "X-RapidAPI-Host" => "latest-stock-price.p.rapidapi.com",
        "X-RapidAPI-Key" => "test_api_key"
      }
    end
    let(:query) do
      {
        "Identifier" => identifier
      }
    end

    let(:body) do
      [
        {
          symbol: "NIFTY 50",
          identifier: "NIFTY 50",
          open: 19_989.5,
          dayHigh: 20_096.9,
          dayLow: 19_944.1,
          lastPrice: 20_070,
          previousClose: 19_993.2,
          change: 76.79999999999927,
          pChange: 0.38,
          yearHigh: 20_110.35,
          yearLow: 16_747.7,
          totalTradedVolume: 251_394_599,
          totalTradedValue: 243_322_152_997.41,
          lastUpdateTime: "13-Sep-2023 16:00:00",
          perChange365d: 11.47,
          perChange30d: 2.91
        }
      ].to_json
    end

    let(:status) { 200 }

    before do
      allow(LatestStockPrice).to receive(:api_key).and_return("test_api_key")
      stub_request(:get, "https://latest-stock-price.p.rapidapi.com/any")
        .with(headers:, query:).to_return(status:, body:)
    end

    it { expect(subject.first).to be_a LatestStockPrice::Model::Stock }
    it { expect(subject.first.identifier).to eq "NIFTY 50" }
    it { expect(subject.first.open).to eq 19_989.5 }
  end
end
