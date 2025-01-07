# Ruby Object-Oriented Programming Guide

## What is Object-Oriented Programming?
Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects" that contain data and code. The data is in the form of fields (attributes), and the code is in the form of procedures (methods).

## Core OOP Concepts

### 1. Encapsulation
- Bundling data and methods that operate on that data within a single unit (class)
- Hiding internal details and providing an interface
- In Ruby, using private and public methods/variables to hide implementation details and provide controlled access.

### 2. Inheritance
- Creating new classes that are built upon existing classes
- Reusing code and establishing a relationship between parent and child classes

### 3. Polymorphism
- The ability to present the same interface for different underlying forms (data types or classes)
- Method overriding and method overloading

### 4. Abstraction
- Hiding complex implementation details and showing only necessary features
- Reducing complexity by hiding unnecessary details

### 5. Mixin
- A way to share functionality across multiple classes without using inheritance.
- Allow to share reusable behavior across classes without establishing a parent-child relationship.

## Examples in This Project

1. `basic_class.rb`: Demonstrates class creation, instance variables, and methods
2. `inheritance.rb`: Shows how inheritance works with Animal classes
3. `mixins.rb`: Examples of modules and mixins in Ruby
4. `polymorphism.rb`: Demonstrates polymorphic behavior
5. `encapsulation.rb`: Demonstrates encapsulation behavior
6. `abstraction.rb` : Demonstrates abstraction behavior

## How to Run the Examples
Each Ruby file can be run independently:
```bash
ruby basics/basic_class.rb
ruby basics/inheritance.rb
ruby basics/modules_mixins.rb
ruby basics/polymorphism.rb
ruby basics/encapsulation.rb
ruby basics/abstraction.rb
```