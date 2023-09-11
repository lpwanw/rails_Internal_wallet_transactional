# frozen_string_literal: true

require "rails_helper"

RSpec.describe Wallet do
  describe "Associations" do
    it { is_expected.to belong_to(:owner) }
  end

  describe "Validations" do
    subject { build :wallet }

    it { is_expected.to validate_uniqueness_of(:owner_id).scoped_to(:owner_type) }
  end
end
