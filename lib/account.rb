require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

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
    return nil
  end

  def withdraw(amount)
    check_invalid(amount)
    check_funds(amount)

    @balance -= amount
    create_transaction(amount, "debit")
    return nil
  end

  def print_statement
    @statement.print(@transactions)
    return nil
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

  def check_funds(amount)
    raise "Not enough funds. Your balance is: £#{@balance}" unless sufficient_funds?(amount)
  end

  def check_invalid(amount)
    raise "Please enter a valid amount" if amount.negative? || amount * 100 % 1 != 0 
  end
end
