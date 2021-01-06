letters = ('a'..'z')
vowels = %w[a e i o u]
vowels_hash = {}

letters.each_with_index do |letter, index|
  vowels_hash[letter] = (index + 1) if vowels.include?(letter)
end

puts vowels_hash
