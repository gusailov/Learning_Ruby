range = (10..100).to_a
numbers = []

range.each do |index|
  numbers << index if (index % 5).zero?
end
puts numbers.inspect.to_s
