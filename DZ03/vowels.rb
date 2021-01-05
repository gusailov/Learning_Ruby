letters = ('a'..'z').to_a
vowels = %w[a e i o u]
vowels_hash = {}

letters.each do |letter|
  vowels_hash[letter] = (letters.index(letter) + 1) if vowels.include?(letter)
end
puts vowels_hash
