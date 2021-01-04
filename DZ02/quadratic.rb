puts "Введите a"
a = gets.chomp.to_f

puts "Введите b"
b = gets.chomp.to_f

puts "Введите c"
c = gets.chomp.to_f

d = (b**2 - 4 * a * c)

if d > 0
  sqrt_d = Math.sqrt(d)   
  puts "X1:#{(-b + sqrt_d) / (2 * a)}, X2:#{(-b - sqrt_d) / (2 * a)}" 
elsif d.to_f == 0 
  puts "X1=X2:#{-b / (2 * a)}"
else
  puts "Дискриминант равен:#{d}. Корней нет!!!"
end