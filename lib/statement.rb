class Statement
  HEADER = "date || credit || debit || balance"

  def print(transactions = [])
    print_header()
    print_transactions(transactions)    
  end

  private

  def print_header
    puts HEADER
  end

  def stringify_date(date)
    date.strftime("%d/%m/%Y")
  end

  def stringify_amount(amount)
    return "\b" if amount.nil?

    '%.2f' % amount
  end

  def sort_transactions(transactions)
    transactions.sort_by! { |transaction| transaction.date }.reverse
  end

  def create_transaction_line(transaction)
    [stringify_date(transaction.date), 
      stringify_amount(transaction.credit),
      stringify_amount(transaction.debit),
      stringify_amount(transaction.running_balance)
    ]
  end

  def print_transactions(transactions)
    transactions = sort_transactions(transactions)
    transactions.each { |transaction|
      line = create_transaction_line(transaction)
      puts line.join(" || ")
    }
  end
end
