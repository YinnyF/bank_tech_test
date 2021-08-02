require 'account'

describe Account do
  let(:transaction_class_double) { double(:Transaction) }
  let(:transaction_double) { double(:transaction) }
  subject { described_class.new(transaction_class_double) }

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
      expect(subject.withdraw(20)).to eq(80)
    end

    it "cannot withdraw more than what's in the bank account" do
      expect { subject.withdraw(2 * money) }.to raise_error "Not enough funds. Your balance is: £#{money}"
    end

    it "creates a transaction" do
      expect(transaction_class_double).to receive(:new).once
      subject.withdraw(50)
    end
  end
end
