# GUIDE

## 1. Development tools

- RVM (Ruby Version Manager)

- ruby 3.2.2

- Rails 7.0.6

- Bundler 2.4.15

- MySQL 8.0.33

## 2. Getting started

- Create your `.env` by copy `.env.example` and replace your ENVs

### a prepare db
```shell
rails db:create
rails db:migrate
```
### b API-docs
```shell
RAILS_ENV=test rails rswag
```

## 3. Requirement

### a. polymorphic
    User, Team, Stock have their own wallet.

### b. record in database
    use Model Transaction to track all request
### c. Validate for each transaction
### d. apply ACID
- A: check if balance of wallet is available to create debit transaction
- C: Validate in each transaction, each owner record
- I: use with_lock to ensure. multiple transaction process in the same time will not brake the wallet balance
- D: when the transaction is committed, it remain so
### e. Check Wallet balance
```ruby
    # balance calculated by summing Transaction records
    user.wallet.balance

    # implementation
    def balance
      credits = credit_transactions.sum(:amount)
      debits = debit_transactions.sum(:amount)
      credits - debits
    end
```
