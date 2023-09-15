# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    symbol { FFaker::Currency.unique.code }
    display_name { FFaker::Company.unique.name }
  end
end
