# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    symbol { FFaker::Currency.unique.code }
  end
end
