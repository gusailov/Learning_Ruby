shopcart = [{}]

loop do
  puts 'Введите название товара'
  product = gets.chomp

  puts 'Введите цену за единицу товара'
  price = gets.chomp.to_f

  puts 'Введите количество или стоп'
  qty = gets.chomp.to_f

shopcart = **shopcart,{'product'=>product},{'price'=>price},{'qty'=>qty}
  
puts 'Продолжить заполнение корзины? Да(д)/Нет(н)'
  input = gets.chomp

  break if input == 'н'
end
puts day
puts month
puts year
