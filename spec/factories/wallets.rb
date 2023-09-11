# frozen_string_literal: true

FactoryBot.define do
  factory :wallet do
    owner factory: %i[user]
  end
end
