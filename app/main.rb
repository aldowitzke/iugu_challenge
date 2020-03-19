require 'active_record'
require 'pry'
require_relative 'account_csv'
require_relative 'transaction_csv'
require_relative 'account_movement'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

Account.destroy_all
Transaction.destroy_all

AccountCsv.call(ARGV[0])
TransactionCsv.call(ARGV[1])

Transaction.all.each do |transaction|
  AccountMovement.call(transaction)
end

Account.all.each do |account|
  puts "Account number: #{account.id} | Balance: #{account.balance}"
end