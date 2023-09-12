# frozen_string_literal: true

require "rails_helper"

RSpec.describe LatestStockPrice::Model::Stock do
  describe "#initialize" do
    subject { described_class.new(attributes) }

    let(:attributes) do
      {
        symbol: "AAPL",
        identifier: "Apple Inc.",
        open: 150.0,
        day_high: 155.0,
        day_low: 148.0,
        last_price: 154.0,
        previous_close: 149.0,
        change: 5.0,
        p_change: 3.33,
        total_traded_volume: 100_000,
        total_traded_value: 15_400_000,
        last_update_time: "2023-09-09 10:00:00",
        year_high: 170.0,
        year_low: 120.0,
        per_change_365d: 25.0,
        per_change_30d: 2.5
      }
    end

    LatestStockPrice::Model::Stock::ATTR_ACCESSORS.each do |attr|
      it { expect(subject.public_send(attr)).to eq(attributes[attr]) }
    end

    context "when some attributes are missing" do
      let(:attributes) { { symbol: "AAPL", identifier: "Apple Inc." } }

      (LatestStockPrice::Model::Stock::ATTR_ACCESSORS - %i[symbol identifier]).each do |attr|
        it { expect(subject.public_send(attr)).to be_nil }
      end

      it { expect(subject.symbol).to eq(attributes[:symbol]) }
      it { expect(subject.identifier).to eq(attributes[:identifier]) }
    end
  end
end
