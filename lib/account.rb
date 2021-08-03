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
    check_invalid(amount)

    @balance += amount
    create_transaction(amount, "credit")
    @balance
  end

  def withdraw(amount)
    raise "Not enough funds. Your balance is: £#{@balance}" unless sufficient_funds?(amount)

    @balance -= amount
    create_transaction(amount, "debit")
    @balance
  end

  def print_statement
    @statement.print(@transactions)
  end

  private

  def create_transaction(amount, type)
    if type == "credit"
      @transactions << @transaction_class.new(credit: amount, running_balance: @balance)
    else
      @transactions << @transaction_class.new(debit: amount, running_balance: @balance)
    end
  end

  def sufficient_funds?(amount)
    @balance >= amount
  end

  def check_invalid(amount)
    raise "Please enter a valid amount" if amount.negative?
  end
end
