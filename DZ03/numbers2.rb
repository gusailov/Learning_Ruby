range = (10..100).to_a
numbers = []

range.each do |number|
  numbers << number if (number % 5).zero?
end
puts numbers.inspect.to_s
