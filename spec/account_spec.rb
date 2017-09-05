require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe 'initialisation' do
    it 'displays a statement with no transactions' do
      statement = "date || credit || debit || balance\n"
      expect { account.statement  }.to output(statement).to_stdout
    end
  end
end
