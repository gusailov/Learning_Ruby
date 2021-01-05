puts 'Как вас зовут?'
name = gets.chomp

puts 'Напишите ваш рост'
height = gets.chomp

puts 'Напишите ваш  вес'
weight = gets.chomp

ideal_weight = (height.to_i - 110) * 1.15
dif = ideal_weight - weight.to_i

puts "#{name}, Ваш идеальный вес  #{ideal_weight}кг"

if dif <= 0
  puts "#{name}, вам нужно сбросить  #{-1 * dif}кг"
else
  puts "#{name}, вам нужно набрать  #{dif}кг"
end
