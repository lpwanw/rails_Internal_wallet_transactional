# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :symbol, null: false, index: { unique: true }
      t.string :display_name, null: false

      t.timestamps
    end
  end
end
