require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:header) { "date || credit || debit || balance\n" }
  let(:deposit) { "10/01/2012 || 1000.00 || || 1000.00\n" }
  let(:withdrawal) { "14/01/2012 || || 500.00 || 500.00\n" }

  describe 'initialisation' do
    it 'displays a statement with no transactions' do
      expect { puts account }.to output(header).to_stdout
    end
  end

  describe '#deposit' do
    it 'takes a date and an amount and increases the balance by the amount' do
      account.deposit('10/01/2012', 1000)
      expect { puts account }.to output(header + deposit).to_stdout
    end
  end

  describe '#withdraw' do
    it 'takes a date and an amount and decreases the balance by the amount' do
      account.deposit('10/01/2012', 1000)
      account.withdraw('14/01/2012', 500)
      expect { puts account }.to output(header + withdrawal + deposit).to_stdout
    end

    it 'raises an error when attempting to withdraw more than the balance' do
      expect { account.withdraw('14/01/2012', 500) }.to raise_error 'Insufficient balance'
    end
  end
end
