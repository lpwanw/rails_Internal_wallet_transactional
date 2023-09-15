# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create User

users = Array.new(3) do |index|
  user = FactoryBot.create(:user, email: "lp.wanw+#{index}@gmail.com")
  user.create_wallet
  user
end

# init User balance
users.each do |user|
  new_balance = rand(20..1000) # random from 0 to 1000 $
  user.wallet.credit_transactions.create(amount: new_balance)
end
