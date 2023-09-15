# frozen_string_literal: true

# DO NOT USE THIS CLASS DIRECTLY. Use its subclasses like CreditTransaction or DebitTransaction.
class Transaction < ApplicationRecord
  MODEL_SETTINGS = Settings.models.transaction

  enum transaction_type: {
    credit: "credit",
    debit: "debit"
  }

  belongs_to :source_wallet, class_name: "Wallet", optional: true, inverse_of: :debit_transactions
  belongs_to :target_wallet, class_name: "Wallet", optional: true, inverse_of: :credit_transactions

  validates :source_wallet_id, presence: true, if: :debit?
  validates :target_wallet_id, presence: true, if: :credit?

  validates :source_wallet_id, inclusion: { in: [nil] }, if: :credit?
  validates :target_wallet_id, inclusion: { in: [nil] }, if: :debit?

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: MODEL_SETTINGS.amount.numericality.greater_than }
end
