# frozen_string_literal: true

require "rails_helper"

RSpec.describe Token do
  describe ".has_secure_token" do
    it { is_expected.to have_secure_token(:access_token) }
    it { is_expected.to have_secure_token(:refresh_token) }
  end

  describe "Callbacks" do
    subject { token.save }

    let(:token) { build :token, expires_at: nil }
    let(:now) { "2023-09-11 12:00" }

    before do
      travel_to "2023-09-11 12:00:00"
      subject
    end

    it { expect(token.expires_at).to eq "2023-09-11 20:00:00" }
  end
end
