class Transaction
  attr_reader :date, :debit, :credit, :running_balance

  def initialize(debit: nil, credit: nil, running_balance:)
    @date = Time.now
    @debit = debit
    @credit = credit
    @running_balance = running_balance
  end
end
