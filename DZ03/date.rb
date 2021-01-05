puts 'Введите номер дня'
day = gets.chomp.to_i

puts 'Введите номер месяца'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_i

year_low = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
year_hi = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if month == 1
  puts "Это #{day} день в году"
elsif (year % 4).zero? && year % 100 != 0 || (year % 400).zero?
  month_sum = year_hi.shift(month - 1)
  puts "Это #{month_sum.sum + day} день в году"
else
  month_sum = year_low.shift(month - 1)
  puts "Это #{month_sum.sum + day} день в году"
end
