# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stock do
  describe "Associations" do
    it { is_expected.to have_one(:wallet).dependent(:destroy) }
  end

  describe "Validations" do
    subject { build :stock }

    it { is_expected.to validate_presence_of(:symbol) }
    it { is_expected.to validate_uniqueness_of(:symbol).case_insensitive }
    it { is_expected.to validate_length_of(:symbol).is_at_most(255) }
  end
end
