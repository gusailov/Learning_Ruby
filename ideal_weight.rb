puts "Как вас зовут?"
name = gets.chomp

puts "Напишите ваш рост"
height = gets.chomp

ideal_weight = (height.to_i- 110)* 1.15

puts "#{name}, Ваш идеальный вес  #{ideal_weight} кг" 