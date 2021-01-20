class Railroad
  attr_reader :stations, :trains, :routes

  NUMBER_FORMAT = /^\w{3}-?\w{2}$/.freeze
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def seed
    ('a'..'f').each { |i| @stations << Station.new(i) }
    (1..3).each { |i| @trains << CargoTrain.new(i) }
    (4..6).each { |i| @trains << PassengerTrain.new(i) }
    @routes << Route.new(stations.first, stations.last)
  end

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
      when 7 then add_wagon_to_train
      when 8 then del_wagon_to_train
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

  protected

  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    if @stations.any? { |st| st.name == name }
      puts 'Станция с таким именем уже существует'
    else
      @stations << Station.new(name)
      puts "Станция #{name} создана успешно"
    end
  end

  def create_train
    attempt = 0
    begin
      puts 'Введите номер поезда в формате ХХХ-ХХ'
      number = gets.chomp
      puts 'Введите: 1 - создать грузовой поезд, 2 - создать пассажирский'
      command = gets.to_i
      case command
      when 1
        train = CargoTrain.new(number)
        trains << train
        puts "Поезд с номером:#{number}, типа:#{train.type}, создан успешно"
      when 2
        train = PassengerTrain.new(number)
        trains << train
        puts "Поезд с номером:#{number}, типа:#{train.type}, создан успешно"
      else
        puts 'Команда введена не правильно'
      end
    rescue RuntimeError => e
      puts e.inspect
      attempt += 1
      retry if attempt < 3
      puts 'формат номера не соответствует ХХХ-ХХ'
    end
  end

  def create_route
    if @stations.empty?
      puts 'Сначала нужно создать хотя бы две станции'
    else
      start = station_from_list('Выберите номер начальной станции')
      finish = station_from_list('Выберите номер конечной станции')
      if start == finish
        puts 'Начальная и конечная станции не могут совпадать'
      else
        routes << Route.new(start, finish)
        puts "Маршрут от #{start.name.inspect} до #{finish.name.inspect} создан"
      end
    end
  end

  def add_station_in_route
    if @stations.empty?
      puts 'Сначала нужно создать хотя бы две станции'
    else
      route = route_from_list
      route.put_stations_list
      station = station_from_list('Выберите станцию для добавления')
      if route.stations.include?(station)
        puts 'Станция уже в есть в маршруте'
      else
        route.add_station(station)
        route.put_stations_list
      end
    end
  end

  def del_station_in_route
    route = route_from_list
    station = station_from_route(route)
    route.remove_station(station)
    route.put_stations_list
  end

  def take_route_for_train
    route = route_from_list
    train = train_from_list
    train.add_route(route)
  end

  def add_wagon_to_train
    train = train_from_list
    wagon = train.accept_class_wagon.new
    train.add_wagon(wagon)
  end

  def del_wagon_to_train
    train = train_from_list
    train.remove_wagon
  end

  def move_train_route_forward
    train = train_from_list
    train.go_next_station
  end

  def move_train_route_back
    train = train_from_list
    train.go_previous_station
  end

  def show_information
    station = station_from_list
    station.put_trains_list
  end

  def show_station_for_train
    train = train_from_list
    train.route_point
    train.route.put_stations_list
  end

  def show_station_list
    @stations.each_with_index do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def show_routes_list
    @routes.each_with_index do |route, index|
      puts "#{index} - #{route}"
    end
  end

  def show_trains_list
    @trains.each_with_index do |train, index|
      puts "#{index} - #{train.number}:#{train.type}"
    end
  end

  def show_stations_in_route(route)
    route.stations.each_with_index do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def station_from_list(text = 'Выберите станцию')
    loop do
      puts text
      show_station_list
      index = gets.to_i
      check = (index.negative? || index > (@stations.count - 1))
      puts 'Такой станции нет в списке' if check
      return @stations[index] unless check
    end
  end

  def station_from_route(route)
    loop do
      puts 'Выберите станцию'
      show_stations_in_route(route)
      index = gets.to_i
      check = (index.negative? || index > (route.stations.count - 1))
      puts 'Такой станции нет в списке' if check
      return route.stations[index] unless check
    end
  end

  def route_from_list
    loop do
      puts 'Выберите машрут'
      show_routes_list
      index = gets.to_i
      check = (index.negative? || index > (@routes.count - 1))
      puts 'Такого маршрута нет в списке' if check
      return @routes[index] unless check
    end
  end

  def train_from_list
    loop do
      puts 'Выберите поезд'
      show_trains_list
      index = gets.to_i
      check = (index.negative? || index > (@trains.count - 1))
      puts 'Такого поезда нет в списке' if check
      return @trains[index] unless check
    end
  end
end
