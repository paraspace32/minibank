module Banking
  module_function

  def balance(account)
    return "#{account[:balance]} is your current account balance"
  end

  def withdraw(account, amount)
    return "#{amount} is greater than daily limit" if amount > account[:limit]
    return "#{amount} is greater than current balance" if amount > account[:balance]

    account[:balance] = account[:balance] - amount
    return "#{amount} is withdrawn, #{account[:balance]} is your current account balance"
  end

  def deposit(account, amount)
    account[:balance] = account[:balance] + amount
    return "#{amount} is deposited, #{account[:balance]} is your current account balance"
  end
end
