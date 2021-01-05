letters = ('a'..'z').to_a

puts(letters.select { |letter| letter =~ /[aeiou]/ })
