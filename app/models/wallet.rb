# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :owner_id, uniqueness: { scope: [:owner_type] }
end
