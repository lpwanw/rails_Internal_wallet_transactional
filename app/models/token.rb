# frozen_string_literal: true

class Token < ApplicationRecord
  MODEL_SETTINGS = Settings.models.token

  belongs_to :user

  before_create :generate_expires_at

  has_secure_token :access_token
  has_secure_token :refresh_token

  private

  def generate_expires_at
    self.expires_at = Time.zone.now + MODEL_SETTINGS.ttl
  end
end
