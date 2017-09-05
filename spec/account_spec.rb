require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:header) { "date || credit || debit || balance\n" }
  let(:deposit) { "10/01/2012 || 1000.00 || || 1000.00\n" }

  describe 'initialisation' do
    it 'displays a statement with no transactions' do
      expect { puts account.statement }.to output(header).to_stdout
    end
  end

  describe '#deposit' do
    it 'takes a date and an amount and increases the balance by the amount' do
      account.deposit('10/01/2012', 1000)
      expect { puts account.statement }.to output(header + deposit).to_stdout
    end
  end
end
