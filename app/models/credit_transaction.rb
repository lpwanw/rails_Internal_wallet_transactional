# frozen_string_literal: true

class CreditTransaction < Transaction # rubocop:disable CustomCops/NoDirectTransactionUsage
  before_validation -> { assign_attributes(transaction_type: :credit) }

  validates :target_wallet_id, presence: true
  validates :source_wallet_id, inclusion: { in: [nil] }
end
