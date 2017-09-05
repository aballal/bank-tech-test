require 'date'

# Class representing an account
class Account
  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(date, amount)
    update_balance(amount)
    insert_transaction(date, amount, balance)
  end

  def withdraw(date, amount)
    fail_if_insufficient_balance(amount)
    update_balance(-amount)
    insert_transaction(date, -amount, balance)
  end

  def statement
    to_s
  end

  def to_s
    header + transactions.reverse.map do |transaction|
      formatted_transaction(transaction)
    end.join
  end

  private

  attr_reader :transactions, :balance

  def update_balance(amount)
    @balance += amount
  end

  def insert_transaction(date, amount, balance)
    @transactions << { date: Date.parse(date),
                       amount: amount * 1.0,
                       balance: balance }
  end

  def fail_if_insufficient_balance(amount)
    raise 'Insufficient balance' if amount > balance
  end

  def header
    "date || credit || debit || balance\n"
  end

  def formatted_transaction(transaction)
    formatted_date(transaction[:date]) +
      formatted_amount(transaction[:amount]) +
      formatted_balance(transaction[:balance]) + "\n"
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y') + ' || '
  end

  def formatted_amount(amount)
    if amount >= 0
      format('%.2f', amount) + ' || || '
    else
      '|| ' + format('%.2f', -amount) + ' || '
    end
  end

  def formatted_balance(balance)
    format('%.2f', balance)
  end
end
