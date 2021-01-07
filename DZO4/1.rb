puts 'Введите номер дня'
day = gets.chomp.to_i

puts 'Введите номер месяца'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_i

year_low = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

year_low[1] = 29 if (year % 4).zero? && year % 100 != 0 || (year % 400).zero?
month_sum = year_low.take(month - 1).sum

puts "Это #{month_sum + day} день в году"
