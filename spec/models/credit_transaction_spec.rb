# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreditTransaction do
  describe "Enums" do
    it do
      is_expected.to define_enum_for(:transaction_type).with_values({ credit: "credit", debit: "debit" })
                                                       .backed_by_column_of_type(:string)
    end
  end

  describe "Associations" do
    it do
      is_expected.to belong_to(:source_wallet).class_name("Wallet")
                                              .optional(true)
                                              .inverse_of(:debit_transactions)
    end

    it do
      is_expected.to belong_to(:target_wallet).class_name("Wallet")
                                              .optional(true)
                                              .inverse_of(:credit_transactions)
    end
  end

  describe "Validations" do
    subject { build :credit_transaction }

    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

    it { is_expected.to validate_presence_of(:target_wallet_id) }
    it { is_expected.not_to validate_presence_of(:source_wallet_id) }

    it { is_expected.to validate_inclusion_of(:source_wallet_id).in_array([nil]) }
    it { is_expected.not_to validate_inclusion_of(:target_wallet_id).in_array([nil]) }
  end
end
