class Transaction
  attr_reader :date, :running_balance

  def initialize(running_balance:)
    @date = Time.now
    @running_balance = running_balance
  end
end
