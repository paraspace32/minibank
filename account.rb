class Account
  def self.create_account(email, password)
    return { email: email, password: password, balance: 0, limit: 1000 }
  end
end