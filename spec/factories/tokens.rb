# frozen_string_literal: true

FactoryBot.define do
  factory :token do
    user
    access_token { nil }
    refresh_token { nil }
    expires_at { nil }
  end
end
