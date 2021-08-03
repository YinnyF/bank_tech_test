require 'transaction'
require 'timecop'

describe Transaction do
  it "has a date when initialised" do
    Timecop.freeze(Time.local(2012, 01, 10)) do
      subject = described_class.new(running_balance: 1000)
      expect(subject.date).to eq(Time.local(2012, 01, 10))
    end
  end

  it "has a running_balance" do
    subject = described_class.new(running_balance: 2000)
    expect(subject.running_balance).to eq 2000
  end

end

# let(:transaction_1) { double('transaction', date: Time.local(2012, 01, 10), debit: nil, credit: 1000, running_balance: 1000) }
# let(:transaction_2) { double('transaction', date: Time.local(2012, 01, 13), debit: nil, credit: 2000, running_balance: 3000) }
# let(:transaction_3) { double('transaction', date: Time.local(2012, 01, 14), debit: 500, credit: nil, running_balance: 2500) }
