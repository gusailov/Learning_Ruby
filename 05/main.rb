require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'railroad'

CARGO_TYPE = 'cargo'.freeze
PASS_TYPE = 'pass'.freeze

MAIN_MENU = <<-MENU.freeze
    Выберите пункт меню:
    Введите 1 - cоздавать станции
    Введите 2 - создавать поезда
    Введите 3 - создавать маршруты
    Введите 4 - добавить станцию в маршрут
    Введите 5 - удалить станцию в маршруте
    Введите 6 - назначать маршрут поезду
    Введите 7 - Добавлять вагоны к поезду
    Введите 8 - Отцеплять вагоны от поезда
    Введите 9 - Перемещать поезд по маршруту вперед
    Введите 10 - Перемещать поезд по маршруту назад
    Введите 11 - Просматривать список станций и список поездов на станции
    Введите 12 - Просматривать станции для поезда
    Введите 0 - Выйти из программы
MENU

def run
  command = ''
  while command != 0
    puts MAIN_MENU
    command = gets.to_i
    case command
    when 1 then create_station
    when 2 then create_train
    when 3 then create_route
    when 4 then add_station_in_route
    when 5 then del_station_in_route
    when 6 then take_route_for_train
    when 7 then add_wagon_for_train
    when 8 then del_wagon_for_train
    when 9 then move_train_route_forward
    when 10 then move_train_route_back
    when 11 then show_information
    when 12 then show_station_for_train
    when 0 then break
    else
      puts 'Команда введена не правильно'
    end
  end
end

def create_station
  puts 'Введите название станции'
  name = gets.chomp
  Station.new(name)
end
