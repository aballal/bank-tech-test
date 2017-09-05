require 'date'

# Class representing an account
class Account
  def initialize
    @transactions = SortedSet.new
    @balance = 0
  end

  def deposit(date, amount)
    @transactions << { date: Date.parse(date), amount: amount * 1.0 }
    @balance += amount
  end

  def statement
    to_s
  end

  def to_s
    header +
      transactions.map { |transaction| formatted_transaction(transaction) }.join
  end

  private

  attr_reader :transactions, :balance

  def header
    "date || credit || debit || balance\n"
  end

  def formatted_transaction(transaction)
    formatted_date(transaction[:date]) +
      formatted_amount(transaction[:amount]) + formatted_balance + "\n"
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y') + ' || '
  end

  def formatted_amount(amount)
    if amount >= 0
      format('%.2f', amount) + ' || || '
    else
      '|| ' + format('%.2f', -amount) + '|| '
    end
  end

  def formatted_balance
    format('%.2f', balance)
  end
end
