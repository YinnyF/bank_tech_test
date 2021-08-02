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

  private

  def create_transaction()
    @transaction_class.new
  end
end
