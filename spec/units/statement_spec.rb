require 'statement'

describe Statement do
  let(:header) { "date || credit || debit || balance\n" }

  context 'without any transactions' do
    it 'can print the header' do
      expect { subject.print }.to output(header).to_stdout
    end
  end

  context 'with transactions' do
    let(:transaction_1) { double('transaction', date: Time.local(2012, 01, 10), debit: nil, credit: 1000, running_balance: 1000) }
    let(:transaction_2) { double('transaction', date: Time.local(2012, 01, 13), debit: nil, credit: 2000, running_balance: 3000) }
    let(:transaction_3) { double('transaction', date: Time.local(2012, 01, 14), debit: 500, credit: nil, running_balance: 2500) }

    it { is_expected.to respond_to(:print).with(1).argument }

    it 'can print the statement when given a transaction' do
      transactions = [transaction_1]
      statement = header + "10/01/2012 || 1000.00 || \b || 1000.00\n"
      expect { subject.print(transactions) }.to output(statement).to_stdout
    end

    it 'can print the statement in reverse chronolocal order when given an array of transactions' do
      transactions = [transaction_1, transaction_2, transaction_3]
      # quick fix for backspace escape character - please revise later.
      statement = header + "14/01/2012 || \b || 500.00 || 2500.00\n13/01/2012 || 2000.00 || \b || 3000.00\n10/01/2012 || 1000.00 || \b || 1000.00\n"
      expect { subject.print(transactions) }.to output(statement).to_stdout
    end

  end
end
