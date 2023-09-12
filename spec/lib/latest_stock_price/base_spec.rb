# frozen_string_literal: true

require "rails_helper"

RSpec.describe LatestStockPrice::Base do
  describe ".headers" do
    subject { described_class.send(:headers) }

    let(:expected_headers) do
      {
        "X-RapidAPI-Host" => "latest-stock-price.p.rapidapi.com",
        "X-RapidAPI-Key" => "test_api_key"
      }
    end

    before { allow(LatestStockPrice).to receive(:api_key).and_return("test_api_key") }

    it { is_expected.to eq expected_headers }
  end

  describe ".base_url" do
    subject { described_class.send(:base_url) }

    it { is_expected.to eq "https://latest-stock-price.p.rapidapi.com/" }
  end

  describe ".handle_response" do
    let(:result) { described_class.send(:handle_response) }

    let(:response) { instance_double("Response", success?: success, body:) } # rubocop:disable RSpec/VerifiedDoubleReference

    let(:body) do
      [
        {
          "symbol" => "VBL",
          "identifier" => "VBLEQN",
          "open" => 926.8,
          "day_high" => 931,
          "day_low" => 906.55,
          "last_price" => 921.25,
          "previous_close" => 919.6,
          "change" => 1.65,
          "p_change" => 0.18,
          "total_traded_volume" => 2_431_229,
          "total_traded_value" => 2_236_779_304.58,
          "last_update_time" => "12-Sep-2023 15:59:09",
          "year_high" => 942,
          "year_low" => 482.55,
          "per_change_365d" => nil,
          "per_change_30d" => nil
        }
      ].to_json
    end

    before do
      described_class.instance_variable_set(:@response, response)
    end

    context "when the response is successful" do
      let(:success) { true }

      it { expect(result.first).to be_a(LatestStockPrice::Model::Stock) }
    end

    context "when the response is not successful" do
      let(:success) { false }

      it { expect { result }.to raise_error(StandardError) }
    end
  end
end
