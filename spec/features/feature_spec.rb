require 'account'

describe 'Bank' do
  it 'has an account that you can deposit money' do
    account = Account.new
    expect(account.deposit(50)).to eq 50
  end

  it 'has an account that you can withdraw money from' do
    account = Account.new
    account.deposit(1000)
    expect(account.withdraw(50)).to eq 950
  end
end
