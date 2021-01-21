require_relative 'modules'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railroad'

MAIN_MENU = <<-MENU.freeze
    Выберите пункт меню:
    Введите 1 - cоздать станцию
    Введите 2 - создать поезд
    Введите 3 - создать маршрут
    Введите 4 - создать вагон
    Введите 5 - добавить станцию в маршрут
    Введите 6 - удалить станцию в маршруте
    Введите 7 - назначать маршрут поезду
    Введите 8 - Добавлять вагоны к поезду
    Введите 9 - Отцеплять вагоны от поезда
    Введите 10 - Перемещать поезд по маршруту вперед
    Введите 11 - Перемещать поезд по маршруту назад
    Введите 12 - Просматривать список станций и список поездов на станции
    Введите 13 - Просматривать станции для поезда
    Введите 0 - Выйти из программы
MENU
