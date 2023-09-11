# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true

  has_many :credit_transactions, class_name: "Transaction",
                                 foreign_key: "target_wallet_id",
                                 inverse_of: :target_wallet,
                                 dependent: :delete_all
  has_many :debit_transactions, class_name: "Transaction",
                                foreign_key: "source_wallet_id",
                                inverse_of: :source_wallet,
                                dependent: :delete_all

  validates :owner_id, uniqueness: { scope: [:owner_type] }
end
