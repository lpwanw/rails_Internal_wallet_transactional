# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    source_wallet { nil }
    target_wallet { nil }
    amount { rand 1..200 }
    transaction_type { Transaction.transaction_types.keys.sample }

    trait :credit_transaction do
      transaction_type { "credit" }
      target_wallet factory: %i[wallet]
      source_wallet { nil }
    end

    trait :debit_transaction do
      transaction_type { "debit" }
      source_wallet factory: %i[wallet]
      target_wallet { nil }
    end

    factory :credit_transaction, traits: %i[credit_transaction]
    factory :debit_transaction, traits: %i[debit_transaction]
  end
end
