# Calculate number of even and odd numbers from the given series
evencount,oddcount=0,0
for i in 2..10
  if(i%2 == 0)
    evencount+=1
  else
    oddcount+=1
  end
end
puts "Number of even numbers: #{evencount}"
puts "Number of odd numbers: #{oddcount}"

