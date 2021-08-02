require 'transaction'

class Account
  def initialize(transaction_class = Transaction)
    @balance = 0
    @transaction_class = transaction_class
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

  private

  def create_transaction
    @transaction_class.new
  end

  def sufficient_funds?(amount)
    @balance > amount
  end
end
