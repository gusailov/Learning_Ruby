range = (10..100).to_a

puts(range.select { |number| (number % 5).zero? })
