# Module for swimming behavior
# A mixin is a module that provides methods that can be included into a class.
module Swimmable
  def swim
    "#{self.class} is swimming!"
  end
end

# Module for flying behavior
module Flyable
  def fly
    "#{self.class} is flying high!"
  end
end

# Classes using modules
class Duck
  include Swimmable
  include Flyable

  def speak
    "Quack!"
  end
end

class Penguin
  include Swimmable

  def speak
    "Squawk!"
  end
end

# Usage
duck = Duck.new
penguin = Penguin.new

puts "Duck behaviors:"
puts duck.speak
puts duck.swim
puts duck.fly

puts "Penguin behaviors:"
puts penguin.speak
puts penguin.swim