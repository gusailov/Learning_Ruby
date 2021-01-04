puts "Введите a"
a = gets.chomp.to_f

puts "Введите b"
b = gets.chomp.to_f

puts "Введите c"
c = gets.chomp.to_f

d=(b**2-4*a*c)

if d <0 
   puts "Дискриминант равен:#{d.to_f}. Корней нет!!!"
elsif d.to_f==0 
    puts "X1=X2:#{-b/(2*a)}"
else puts "X1:#{(-b+Math.sqrt(d.to_f))/(2*a)}, X2:#{(-b-Math.sqrt(d.to_f))/(2*a)}"
end