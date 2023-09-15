# frozen_string_literal: true

class Team < ApplicationRecord
  has_one :wallet, as: :owner, dependent: :destroy

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { maximum: 255 }

  validates :display_name, presence: true
  validates :display_name, length: { maximum: 255 }
end
