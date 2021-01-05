range = (10..100).to_a
numbers = []

i = 10
while i <= range.length
  numbers << i
  i += 5
end
puts numbers.inspect.to_s
