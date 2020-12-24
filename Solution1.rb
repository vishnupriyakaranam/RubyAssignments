# Largest of 3 numbers
puts "Enter 3 distinct numbers seprated by Enter or space"
x,y,z = gets.chomp.to_i,gets.chomp.to_i,gets.chomp.to_i
if x >= y and x >= z
  puts "#{x} is greatest."
elsif y >= z and y >= x
  puts "#{y} is greatest."
else
  puts "#{z} is greatest."
end
