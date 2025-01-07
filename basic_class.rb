# A class defines the blueprint for objects, and objects are instances of a class.
class Person
  # Constructor method
  def initialize(name, age)
    @name = name  # Instance variable
    @age = age    # Instance variable
  end

  # Getter methods
  def name
    @name
  end

  def age
    @age
  end

  # Setter methods
  def name=(new_name)
    @name = new_name
  end

  # Instance method
  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old!"
  end

  # Class method
  def self.species
    "Homo Sapiens"
  end
end

# Creating and using objects

puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp

person = Person.new(name, age)
person.introduce

puts "Species: #{Person.species}"
person.name = "Alicia"
# person.age will give an error as we did not set a setter method for that.
person.introduce