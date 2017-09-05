class Account
  def statement
    statement = header
    puts statement
  end

  private

  def header
    "date || credit || debit || balance\n"
  end
end
