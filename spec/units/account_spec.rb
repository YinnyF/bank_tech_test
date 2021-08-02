require 'account'

describe Account do
  context '#deposit' do
    it "can deposit 50 then return the balance" do
      expect(subject.deposit(50)).to eq(50)
    end 

    it "can deposit multiple times" do
      4.times{ subject.deposit(50) }
      expect(subject.deposit(50)).to eq(250)
    end
  end
end
