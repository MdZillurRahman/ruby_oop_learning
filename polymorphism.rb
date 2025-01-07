# Base class for shapes
class Shape
  def area
    raise NotImplementedError, "Subclass must implement abstract method"
  end

  def perimeter
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

# Different shape implementations
class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius ** 2
  end

  def perimeter
    2 * Math::PI * @radius
  end
end

class Rectangle < Shape
  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
    @length * @width
  end

  def perimeter
    2 * (@length + @width)
  end
end

# Usage demonstrating polymorphism
shapes = [
  Circle.new(5),
  Rectangle.new(4, 6)
]

shapes.each do |shape|
  puts "Shape: #{shape.class}"
  puts "Area: #{shape.area.round(2)}"
  puts "Perimeter: #{shape.perimeter.round(2)}"
  puts "---"
end