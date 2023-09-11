# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Error::UnauthorizedError do
  let(:error) { described_class.new message }
  let(:message) { nil }

  describe "#status" do
    subject { error.status }

    it { is_expected.to eq :unauthorized }
  end

  describe "#error_message" do
    subject { error.error_message }

    context "when message is nil" do
      let(:message) { nil }

      it { is_expected.to eq "unauthorized" }
    end

    context "when message is present" do
      let(:message) { FFaker::Lorem.sentence }

      it { is_expected.to eq message }
    end
  end

  describe "#errors" do
    subject { error.errors }

    let(:errors) do
      [
        full_message: "unauthorized"
      ]
    end

    it { is_expected.to eq errors }
  end
end
