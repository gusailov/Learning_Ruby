shopcart = {}
sum = []

loop do
  puts 'Введите название товара'
  product = gets.chomp

  puts 'Введите цену за единицу товара'
  price = gets.chomp.to_f

  puts 'Введите количество'
  qty = gets.chomp.to_f

  shopcart_el = { product => { 'price' => price, 'qty' => qty, 'sum ' => (price * qty) } }
  shopcart = shopcart.merge(shopcart_el)
  sum << price * qty

  puts 'Продолжить заполнение корзины? Да(любой ввод)/Нет(н)'
  input = gets.chomp

  break if input == 'н'
end
puts shopcart
puts "Сумма товаров в корзине: #{sum.sum} "
