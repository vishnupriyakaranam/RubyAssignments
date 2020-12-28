require '.\Vehicle'
require '.\Car'

c1 = Car.new
c2 = Car.new

v1 = Vehicle.new

v1.NumberOfWheels = 5
v1.Color = "blue"
v1.Size = "S"

c1.NumberOfWheels = 4
c1.Color = "yellow"
c1.Size = "S"

c2.NumberOfWheels = 4
c2.Color = "red"
c2.Size = "S"

puts "#{v1.NumberOfWheels} | #{v1.Color} | #{v1.Size}"
puts "#{c1.NumberOfWheels} | #{c1.Color} | #{c1.Size}"
puts "#{c2.NumberOfWheels} | #{c2.Color} | #{c2.Size}"
c2.setColor
puts "#{c2.getColor} | #{c2.Color}"
