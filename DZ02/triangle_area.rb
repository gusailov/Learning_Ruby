puts 'Введите основание, см'
base = gets.chomp

puts 'Введите высоту, см'
height = gets.chomp

area = (base.to_f * height.to_f) / 2
puts "Площадь треугольника  #{area}см"
