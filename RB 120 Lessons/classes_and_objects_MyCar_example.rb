=begin
Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define 
some instance variables that tell us the year, color, and model of the car. Create an instance variable 
that is set to 0 during instantiation of the object to track the current speed of the car as well. 
Create instance methods that allow the car to speed up, brake, and shut the car off.
=end 

#Module that can interface with a class if 'included'
module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  #Create getter and setter methods for color and speed. So
  #you can access and change them.
  attr_accessor :color, :speed
  #To make the year and model readable, but not changeable. 
  attr_reader :year, :model

  @@number_of_vehicles = 0
  #Constructor
  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_car_count
    @@number_of_vehicles
  end
  
  def self.calculate_gas_mileage(gallons, miles)
    puts "Your vehicle gets #{miles/gallons} miles per gallon"
  end

  def speed_up(number)
    @speed += number
    puts "You accelerate to #{speed} mph"
  end

  def brake(number)
    @speed -= number
    puts "You decelerate to #{speed} mph"
  end

  def current_speed
    puts "You're going #{speed} mph."
  end

  #Create a method called spray_paint that can be called on an object and will modify the color of the car
  def spray_paint(color)
    self.color = color
    puts "Your new color is #{color}"
  end

  def shut_off
    @speed = 0
    puts "Let's park"
  end

  def age
    "Your #{self.model} is #{years_old} years old"
  end

  #Private keyword makes this method private
  #The method is inaccessible outside of the class. 
  private 
  def years_old
    Time.now.year - self.year
  end
end

#-------------------New subclass
class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  #Override the to_s method. 
  #This string is what will be output when the puts method is 
  #invoked on the instance. 
  def to_s
    "My car is a #{year} #{color} #{model}"
  end
end

#---------------------New subclass
class MyTruck < Vehicle
  TRUCK_TYPE = 'truck'
  include Towable
  def to_s
    "My truck is a #{year} #{color} #{model}"
  end
end 



#The initialize method is invoked every time we instantiate a new object via the *new* method
toyota = MyCar.new(2018, "silver", "corolla")

ford = MyTruck.new(2015, 'white', 'F-150')
ford.speed_up(15)
ford.brake(10)
ford.current_speed
ford.spray_paint('black')
ford.shut_off
puts ford.can_tow?(500)
puts toyota.age
