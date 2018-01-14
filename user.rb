require_relative 'account'
require_relative 'banking'

class User
  attr_accessor :name, :accounts

  def initialize(name)
    @name = name
    @accounts = []
  end

  def add_account(email, password)
    if check_account(@accounts, email)
      @accounts << Account.create_account(email, password)
      puts 'Account is created'
    else
      return 'Please verify details provided'
    end
  end

  def check_balance(email)
    balance = Banking.balance(get_account(@accounts, email))
    puts balance
  end

  def withdraw_money(email, amount)
    account = get_account(@accounts, email)
    return 'Please provide correct credentials' if account.nil?

    left_amount = Banking.withdraw(account, amount)
    puts left_amount
  end

  def deposit_money(email, amount)
    account = get_account(@accounts, email)
    return 'Please provide correct credentials' if account.nil?

    current_balance = Banking.deposit(account, amount)
    puts current_balance
  end

  private

  def check_account(accounts, email)
    return false if email.nil?

    accounts.each do |account|
      if account and account[:email] == email
        return false
      else
        return true
      end
    end
  end

  def get_account(accounts, email)
    return false if email.nil?

    @accounts.each do |account|
      return account if account[:email] == email
    end
  end
end

begin
  user = User.new('Paras')
  user.add_account('paras@minibank.com', 'paras123')
  user.check_balance('paras@minibank.com')
  user.withdraw_money('paras@minibank.com', 200)
  user.deposit_money('paras@minibank.com', 500)
  user.check_balance('paras@minibank.com')
  user.withdraw_money('paras@minibank.com', 200)
  user.check_balance('paras@minibank.com')
rescue StandardError => e
  raise StandardError, 'Bank is temporary down. Please try later'
end