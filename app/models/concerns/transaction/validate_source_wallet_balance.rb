# frozen_string_literal: true

module Transaction::ValidateSourceWalletBalance
  extend ActiveSupport::Concern

  included do
    before_validation :validate_source_wallet_balance, if: :debit?
  end

  private

  def validate_source_wallet_balance
    source_wallet&.with_lock do
      errors.add(:amount, :invalid) if (source_wallet.balance - amount).negative?
    end
  end
end
