require 'active_record'
require 'pry'
require_relative 'account_csv'
require_relative 'transaction_csv'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

AccountCsv.new(ARGV[0]).call
TransactionCsv.new(ARGV[1]).call
