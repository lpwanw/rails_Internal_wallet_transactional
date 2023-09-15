# frozen_string_literal: true

class DebitTransaction < Transaction
  include DebitTransaction::ValidateSourceWalletBalance

  before_validation -> { assign_attributes(transaction_type: :debit) }

  validates :source_wallet_id, presence: true
  validates :target_wallet_id, inclusion: { in: [nil] }
end
