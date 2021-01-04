puts "Введите первую сторону, см"
a = gets.chomp.to_i

puts "Введите вторую сторону, см"
b = gets.chomp.to_i

puts "Введите третью сторону, см"
c = gets.chomp.to_i

if a>b && b>c 
    m=a
    k1=b
    k2=c
elsif b>c
    m=b
    k1=a
    k2=c
else m=c 
     k1=b 
     k2=a
end

if (k1**2+k2**2)==m**2
    puts "Треугольник прямоугольный" 
end

if a==b && b==c
puts "Треугольник равносторонний "   
elsif a==b || b==c || c==a
puts "Треугольник равнобедренный "  
else
puts "Треугольник Треугольник "  
end

