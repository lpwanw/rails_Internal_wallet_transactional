# frozen_string_literal: true

require "rails_helper"

RSpec.describe TokenSerializer do
  let(:json) { serializer.as_json }
  let(:serializer) { described_class.new(token) }
  let(:token) { create :token }

  describe "#id" do
    subject { json[:id] }

    it { is_expected.to eq token.id }
  end

  describe "#user_id" do
    subject { json[:user_id] }

    it { is_expected.to eq token.user_id }
  end

  describe "#access_token" do
    subject { json[:access_token] }

    it { is_expected.to eq token.access_token }
  end

  describe "#refresh_token" do
    subject { json[:refresh_token] }

    it { is_expected.to eq token.refresh_token }
  end

  describe "#expires_at" do
    subject { json[:expires_at] }

    it { is_expected.to eq token.expires_at }
  end
end
