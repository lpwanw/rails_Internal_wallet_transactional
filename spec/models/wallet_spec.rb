# frozen_string_literal: true

require "rails_helper"

RSpec.describe Wallet do
  describe "Associations" do
    it { is_expected.to belong_to(:owner) }

    it do
      is_expected.to have_many(:credit_transactions).class_name("CreditTransaction")
                                                    .with_foreign_key("target_wallet_id")
                                                    .inverse_of(:target_wallet)
                                                    .dependent(:delete_all)
    end

    it do
      is_expected.to have_many(:debit_transactions).class_name("DebitTransaction")
                                                   .with_foreign_key("source_wallet_id")
                                                   .inverse_of(:source_wallet)
                                                   .dependent(:delete_all)
    end
  end

  describe "Validations" do
    subject { build :wallet }

    it { is_expected.to validate_uniqueness_of(:owner_id).scoped_to(:owner_type) }
  end
end
