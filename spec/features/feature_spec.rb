require 'account'
require 'timecop'

describe 'Bank' do
  xit 'has an account that you can deposit money' do
    account = Account.new
    expect(account.deposit(50)).to eq 50
  end

  xit 'has an account that you can withdraw money from' do
    account = Account.new
    account.deposit(1000)
    expect(account.withdraw(50)).to eq 950
  end

  xit "can print the statement" do
    account = Account.new

    Timecop.freeze(Time.local(2012, 01, 10)) do
      account.deposit(1000)
    end

    Timecop.freeze(Time.local(2012, 01, 13)) do
      account.deposit(2000)
    end

    Timecop.freeze(Time.local(2012, 01, 14)) do
      account.withdraw(500)
    end

    statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
    expect(account.print_statement).to eq(statement)
  end
end
