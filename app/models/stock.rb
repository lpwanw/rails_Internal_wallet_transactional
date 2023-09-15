# frozen_string_literal: true

class Stock < ApplicationRecord
  has_one :wallet, as: :owner, dependent: :destroy

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { maximum: 255 }
end
