class Railroad
  attr_reader :stations, :trains, :routes, :wagons

  NUMBER_FORMAT = /^\w{3}-?\w{2}$/.freeze
  TRAINS = { '1' => CargoTrain, '2' => PassengerTrain }.freeze
  WAGONS = { '1' => CargoWagon, '2' => PassengerWagon }.freeze
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = { CargoWagon => [], PassengerWagon => [] }
  end

  def seed
    ('a'..'f').each { |i| @stations << Station.new(i) }
    (1..3).each { |i| @trains << CargoTrain.new("111-2#{i}") }
    (4..6).each { |i| @trains << PassengerTrain.new("111-2#{i}") }
    @routes << Route.new(stations.first, stations.last)
    3.times { @wagons[CargoWagon] << CargoWagon.new(70) }
    5.times { @wagons[PassengerWagon] << PassengerWagon.new(45) }
    @trains.each { |train| @stations.first.take_train(train) }
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
      when 4 then create_wagon
      when 5 then add_station_in_route
      when 6 then del_station_in_route
      when 7 then take_route_for_train
      when 8 then add_wagon_to_train
      when 9 then del_wagon_from_train
      when 10 then move_train_route_forward
      when 11 then move_train_route_back
      when 12 then show_information
      when 13 then show_station_for_train
      when 14 then train_wagons_list
      when 15 then station_trains_list
      when 16 then take_seat_or_volume_in_wagon
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
    puts 'Введите номер поезда в формате ХХХ-ХХ'
    number = gets.chomp
    puts 'Введите: 1 - создать грузовой поезд, 2 - создать пассажирский'
    command = gets.chomp
    train = TRAINS[command].new(number) || (puts 'Команда введена не правильно')
    trains << train
    puts "Поезд с номером:#{number}, типа:#{train.type}, создан успешно"
  rescue RuntimeError => e
    puts e.inspect
    retry
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

  def create_wagon
    puts 'Введите: 1 - создать грузовой вагон, 2 - создать пассажирский'
    command = gets.chomp
    puts 'Введите общий объем(кол-во мест) вагона'
    volume = gets.to_i
    @wagons[WAGONS[command]] << WAGONS[command].new(volume) || (puts 'Команда введена не правильно')
    puts 'Вагон создан успешно'
  rescue RuntimeError => e
    puts e.inspect
    retry
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
    if @wagons[train.accept_class_wagon].empty?
      puts 'Вагонов данного типа на станции нет'
    else
      wagon = @wagons[train.accept_class_wagon].pop
      train.add_wagon(wagon)
      puts 'Вагон успешно добавлен'
    end
  end

  def del_wagon_from_train
    train = train_from_list
    if train.wagons.empty?
      puts 'у поезда нет прицепленых вагонов'
    else
      @wagons[train.accept_class_wagon] << train.wagons.pop
    end
  end

  def move_train_route_forward
    train = train_from_list
    if !train.route
      puts 'Сначала нужно назначить маршрут поезду '
    else
      train.go_next_station
    end
  end

  def move_train_route_back
    train = train_from_list
    if !train.route
      puts 'Сначала нужно назначить маршрут поезду '
    else
      train.go_previous_station
    end
  end

  def show_information
    station = station_from_list
    station.put_trains_list
  end

  def show_station_for_train
    train = train_from_list
    if !train.route
      puts 'Сначала нужно назначить маршрут поезду '
    else
      train.route_point
      train.route.put_stations_list
    end
  end

  def train_wagons_list
    train = train_from_list
    if !train.wagons.empty?
      case train.accept_class_wagon.to_s
      when 'CargoWagon'
        cargo_wagons(train)
      when 'PassengerWagon'
        passenger_wagons(train)
      else
        puts 'такого поезда не существует'
      end
    else
      puts 'У поезда нет вагонов'
    end
  end

  def take_seat_or_volume_in_wagon
    wagons = train_wagons_list
    return unless wagons

    puts 'Введите номер вагона'
    number = gets.chomp
    wagon = wagons.detect { |w| w.number == number }
    case wagon.class.to_s
    when 'CargoWagon'
      puts 'Введите объем, который необходимо занять'
      volume = gets.to_i
      wagon.fill_volume(volume)
    when 'PassengerWagon'
      wagon.take_seat
    else
      puts 'Такого вагона не существует'
    end
  end

  def station_trains_list
    station = station_from_list
    if station.trains.empty?
      puts "На станции #{station.name} нет поездов"
    else
      station.each_trains do |train|
        puts "Номер поезда #{train.number},
        Тип #{train.type}, Количество вагонов - #{train.wagons.size}"
      end
    end
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

  def show_wagons_list
    @wagons.each_with_index do |wagon, index|
      puts "#{index} - #{wagon.number}:#{wagon.type}"
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

  def cargo_wagons(train)
    train.each_wagons do |wagon|
      puts "Тип вагона : #{wagon.class}, номер : #{wagon.number}, свободный объем : #{wagon.available_volume}, занятый объем : #{wagon.occupied_volume}"
    end
  end

  def passenger_wagons(train)
    train.each_wagons do |wagon|
      puts "Тип вагона : #{wagon.class}, номер : #{wagon.number},свободных мест : #{wagon.free_seats}, занятых мест : #{wagon.occupied_seats}"
    end
  end
end
