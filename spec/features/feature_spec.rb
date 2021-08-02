require 'account'

describe 'Bank' do
  it 'has an account that you can deposit money' do
    account = Account.new
    expect(account.deposit(50)).to eq (50)
  end
end