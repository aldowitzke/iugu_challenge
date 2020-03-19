require 'csv'
require 'active_record'
require_relative '../models/Transaction'

class TransactionCsv
  attr_reader :csv, :transactions

  def initialize(csv)
    @csv = csv
  end

  def self.call(*params)
    new(*params).call
  end

  def call
    open_transaction_csv
    save_transactions
  end

  private

  def open_transaction_csv
    @transactions = CSV.read(csv)
  end

  def save_transactions
    transactions.each do |transaction|
      Transaction.new(account_id: transaction[0], value: transaction[1]).save
    end
  end
end