require 'account'

describe Account do
  let(:transaction_class_double) { double(:Transaction) }
  let(:transaction_double) { double(:transaction) }
  let(:statement_double) { double(:statement) }
  subject { described_class.new(transaction_class_double, statement_double) }

  before do
    allow(transaction_class_double).to receive(:new).and_return(transaction_double)
  end

  context '#deposit' do
    it "can deposit 50 then return the balance" do
      expect(subject.deposit(50)).to eq(50)
    end 

    it "can deposit multiple times" do
      4.times { subject.deposit(50) }
      expect(subject.deposit(50)).to eq(250)
    end

    it "creates a transaction" do
      expect(transaction_class_double).to receive(:new).with(running_balance: 50, credit: 50).once
      subject.deposit(50)
    end

    it "raises an error when trying to deposit a negative amount" do
      expect { subject.deposit(-100) }.to raise_error "Please enter a valid amount"
    end

    it "raises an error when trying to deposit penny fractions" do
      expect { subject.deposit(0.001) }.to raise_error "Please enter a valid amount"
    end
  end

  context '#withdraw' do
    let(:money) { 100 }

    before do
      subject.deposit(money)
    end

    it "can withdraw 50 and then return the balance" do
      test_amount = 20
      result = money - test_amount
      
      expect(subject.withdraw(test_amount)).to eq(result)
    end

    it "cannot withdraw more than what's in the bank account" do
      expect { subject.withdraw(2 * money) }.to raise_error "Not enough funds. Your balance is: £#{money}"
    end

    it "can withdraw the full balance in the account" do
      expect(subject.withdraw(money)).to eq 0
    end

    it "creates a transaction" do
      expect(transaction_class_double).to receive(:new).with(running_balance: 50, debit: 50).once
      subject.withdraw(50)
    end

    it "raises an error when trying to withdraw a negative amount" do
      expect { subject.withdraw(-100) }.to raise_error "Please enter a valid amount"
    end

    it "raises an error when trying to withdraw penny fractions" do
      expect { subject.withdraw(0.001) }.to raise_error "Please enter a valid amount"
    end
  end

  context "#print_statement" do
    it "calls print on statement" do
      expect(statement_double).to receive(:print).once
      subject.print_statement
    end

    it "gives an array of transactions to print" do
      subject.deposit(50)
      subject.withdraw(50)
      allow(statement_double).to receive(:print).with([transaction_double, transaction_double])
      expect(statement_double).to receive(:print).once
      subject.print_statement
    end
  end
end
