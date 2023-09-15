# frozen_string_literal: true

require "rails_helper"

RSpec.describe Team do
  describe "Associations" do
    it { is_expected.to have_one(:wallet).dependent(:destroy) }
  end

  describe "Validations" do
    subject { build :team }

    it { is_expected.to validate_presence_of(:symbol) }
    it { is_expected.to validate_uniqueness_of(:symbol).case_insensitive }
    it { is_expected.to validate_length_of(:symbol).is_at_most(255) }

    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_length_of(:display_name).is_at_most(255) }
  end
end
