# Abstract class demonstrating a banking system
class BankAccount
  def initialize(account_number, balance)
    @account_number = account_number
    @balance = balance
    @logger = Logger.new  # Internal implementation detail
  end

  # Public interface
  def deposit(amount)
    if valid_transaction?(amount)
      @balance += amount
      log_transaction("deposit", amount)
      "Successfully deposited #{amount}"
    else
      "Invalid deposit amount"
    end
  end

  def withdraw(amount)
    if valid_transaction?(amount) && sufficient_balance?(amount)
      @balance -= amount
      log_transaction("withdrawal", amount)
      "Successfully withdrew #{amount}"
    else
      "Invalid withdrawal or insufficient funds"
    end
  end

  def balance
    @balance
  end

  private

  # Hidden implementation details
  def valid_transaction?(amount)
    amount.is_a?(Numeric) && amount > 0
  end

  def sufficient_balance?(amount)
    @balance >= amount
  end

  def log_transaction(type, amount)
    @logger.log("#{type}: #{amount}")
  end
end

# Internal logger class (implementation detail)
class Logger
  def log(message)
    puts "[#{Time.now}] #{message}"
  end
end

# Usage
account = BankAccount.new("1234567890", 1000)
puts account.deposit(500)   # Only interact with public methods
puts account.withdraw(200)
puts "Current balance: #{account.balance}"