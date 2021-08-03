require 'transaction'
require 'statement'

class Account
  def initialize(transaction_class = Transaction, statement = Statement.new)
    @balance = 0
    @transaction_class = transaction_class
    @statement = statement
  end

  def deposit(amount)
    create_transaction
    @balance += amount
  end

  def withdraw(amount)
    raise "Not enough funds. Your balance is: £#{@balance}" unless sufficient_funds?(amount)

    create_transaction
    @balance -= amount
  end

  def print_statement
    @statement.print
  end

  private

  def create_transaction
    @transaction_class.new
  end

  def sufficient_funds?(amount)
    @balance >= amount
  end
end
