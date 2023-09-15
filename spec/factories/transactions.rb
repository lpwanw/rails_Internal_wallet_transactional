# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    source_wallet { nil }
    target_wallet { nil }
    amount { rand 1..200 }
    transaction_type { Transaction.transaction_types.keys.sample } # rubocop:disable CustomCops/NoDirectTransactionUsage
  end

  factory :credit_transaction, class: "CreditTransaction" do
    amount { rand 1..200 }
    transaction_type { "credit" }
    target_wallet factory: %i[wallet]
    source_wallet { nil }
  end

  factory :debit_transaction, class: "DebitTransaction" do
    amount { rand 1..200 }
    transaction_type { "debit" }
    source_wallet factory: %i[wallet]
    target_wallet { nil }
  end
end
