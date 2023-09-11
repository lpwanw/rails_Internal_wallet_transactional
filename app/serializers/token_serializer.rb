# frozen_string_literal: true

class TokenSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :access_token, :refresh_token, :expires_at
end
