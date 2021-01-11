numbers = []

i = 0
while i <= 100
  numbers << i
  if i < 1
    i += 1
  else
    i = numbers[-1] + numbers[-2]
  end
end

puts numbers.inspect.to_s
