require 'transaction'
require 'statement'

class Account
  def initialize(transaction_class = Transaction, statement = Statement.new)
    @balance = 0
    @transaction_class = transaction_class
    @statement = statement
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    create_transaction
    @balance
  end

  def withdraw(amount)
    raise "Not enough funds. Your balance is: £#{@balance}" unless sufficient_funds?(amount)

    @balance -= amount
    create_transaction
    @balance
  end

  def print_statement
    @statement.print(@transactions)
  end

  private

  def create_transaction
    @transactions << @transaction_class.new(running_balance: @balance)
  end

  def sufficient_funds?(amount)
    @balance >= amount
  end
end
