require 'csv'
require 'pry'
require 'active_record'
require_relative '../models/Account'

class AccountCsv
  attr_reader :csv, :accounts

  def initialize(csv)
    @csv = csv
  end

  def self.call(*params)
    new(*params).call
  end

  def call
    open_account_csv
    save_accounts
  end

  private

  def open_account_csv
    @accounts = CSV.read(csv)
  end

  def save_accounts
    accounts.each do |account|
      Account.new(id: account[0], balance: account[1]).save
    end
  end
end