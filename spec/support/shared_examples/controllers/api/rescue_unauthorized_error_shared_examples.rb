# frozen_string_literal: true

RSpec.shared_examples "Api::RescueError#rescue_api_error!" do |error_message, full_message, status|
  describe "#rescue_api_error!" do
    before { subject }

    it { expect(response_body[:success]).to be false }
    it { expect(response_body[:error_message]).to eq error_message }
    it { expect(response_body[:errors]).to eq [{ "full_message" => full_message }] }
    it { expect(response).to have_http_status(status) }
  end
end
