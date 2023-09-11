# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Error::BaseError do
  let(:error) { described_class.new message }
  let(:message) { nil }

  describe "#status" do
    subject { error.status }

    it { expect { subject }.to raise_error NotImplementedError }
  end
end
