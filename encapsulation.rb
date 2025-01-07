# Encapsulation means restricting direct access to some of an object's components.
class FinancialCalculator
  def initialize(name, salary, costs, savings)
    @name = name
    self.salary = salary
    self.costs = costs
    self.savings = savings
  end

  def calculate_remaining
    if @costs > @salary
      "#{@name}, your costs exceed your salary."
    elsif calculate_after_costs < @savings
      "#{@name}, your savings exceed your remaining balance after costs."
    else
      remaining = calculate_after_savings
      "#{@name}, you have #{remaining} left after savings and costs."
    end
  end

  # Getter methods
  def salary
    @salary
  end

  def costs
    @costs
  end

  def savings
    @savings
  end

  # Setter methods with validation
  def salary=(amount)
    @salary = validate_non_negative(amount, "Salary")
  end

  def costs=(amount)
    @costs = validate_non_negative(amount, "Costs")
  end

  def savings=(amount)
    @savings = validate_non_negative(amount, "Savings")
  end

  private

  def calculate_after_costs
    @salary - @costs
  end

  def calculate_after_savings
    calculate_after_costs - @savings
  end

  def validate_non_negative(amount, attribute)
    if amount < 0
      raise ArgumentError, "#{attribute} cannot be negative."
    end
    amount
  end
end

# Example usage:
puts "What is your name?"
name = gets.chomp

puts "What is your current salary?"
salary = gets.chomp.to_f

puts "What is your monthly cost?"
costs = gets.chomp.to_f

puts "How much money do you want to save?"
savings = gets.chomp.to_f

begin
  calculator = FinancialCalculator.new(name, salary, costs, savings)
  puts calculator.calculate_remaining
rescue ArgumentError => e
  puts "Error: #{e.message}"
end

