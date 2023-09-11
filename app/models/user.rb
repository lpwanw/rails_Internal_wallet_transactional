# frozen_string_literal: true

class User < ApplicationRecord
  MODEL_SETTINGS = Settings.models.user

  has_secure_password

  before_save :downcase_email

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, length: { maximum: MODEL_SETTINGS.email.length.max }
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, length: { in: MODEL_SETTINGS.password.length.in }, if: :password

  validates :password_confirmation, presence: true, if: :password_digest_changed?

  private

  def downcase_email
    self.email = email.downcase
  end
end
