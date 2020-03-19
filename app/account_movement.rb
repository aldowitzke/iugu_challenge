require 'csv'
require 'pry'
require 'active_record'
require_relative '../models/Account'
require_relative '../models/Transaction'

class AccountMovement
  attr_reader :transaction, :account, :new_balance

  def initialize(transaction)
    @transaction = transaction
  end

  def self.call(*params)
    new(*params).call
  end

  def call
    find_account
    add_value
    check_fine
    update_account_balance
  end

  private

  def find_account
    @account = Account.find(transaction.account_id)
  end
  
  def add_value
    @new_balance = account.balance + transaction.value
  end

  def check_fine
    @new_balance -= 300 if new_balance < 0 && transaction.value < 0
  end

  def update_account_balance
    account.update(balance: new_balance)
  end
end