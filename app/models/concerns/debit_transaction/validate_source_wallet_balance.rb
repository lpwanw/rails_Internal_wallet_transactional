# frozen_string_literal: true

module DebitTransaction::ValidateSourceWalletBalance
  extend ActiveSupport::Concern

  included do
    before_validation :validate_source_wallet_balance
  end

  private

  def validate_source_wallet_balance
    source_wallet&.with_lock do
      errors.add(:amount, :invalid) if (source_wallet.balance - amount).negative?
    end
  end
end
