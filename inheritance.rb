# Parent class
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    raise NotImplementedError, "Subclass must implement abstract method"
  end

  def name
    @name
  end
end

# Child classes
class Dog < Animal
  def speak
    "#{@name} says Woof!"
  end

  def fetch(item)
    "#{@name} is fetching the #{item}"
  end
end

class Cat < Animal
  def speak
    "#{@name} says Meow!"
  end

  def scratch
    "#{@name} is scratching"
  end
end

# Usage
dog = Dog.new("Rex")
cat = Cat.new("Whiskers")

puts dog.speak
puts dog.fetch("ball")
puts cat.speak
puts cat.scratch