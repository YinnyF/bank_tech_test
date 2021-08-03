require 'statement'

describe Statement do
  it 'can print the header' do
    expect { subject.print }.to output("date || credit || debit || balance\n").to_stdout
  end
end
