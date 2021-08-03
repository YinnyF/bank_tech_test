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
      expect(transaction_class_double).to receive(:new).once
      subject.deposit(50)
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
      expect { subject.withdraw(money) }.not_to raise_error "Not enough funds. Your balance is: £#{money}"
    end

    it "creates a transaction" do
      expect(transaction_class_double).to receive(:new).once
      subject.withdraw(50)
    end
  end

  context "#print_statement" do
    it "outputs the statement to the console in the correct format" do
      subject.deposit(50)
      subject.withdraw(50)
      allow(statement_double).to receive(:print).and_return("You printed the statement")
      expect(statement_double).to receive(:print).once
      subject.print_statement
    end
  end
end
