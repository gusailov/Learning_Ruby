class Railroad
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def seed
    @stations << Station.new('a') << Station.new('b') << Station.new('c') << Station.new('e')
    @trains << CargoTrain.new(1,
                              CARGO_TYPE) << PassengerTrain.new(2,
                                                                PASS_TYPE) << PassengerTrain.new(3,
                                                                                                 PASS_TYPE) << PassengerTrain.new(
                                                                                                   4, CARGO_TYPE
                                                                                                 )
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

  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    stations << Station.new(name)
  end

  def create_train
    puts 'Введите номер поезда'
    number = gets.chomp
    puts puts <<-TRAIN_TYPE
        Введите 1 - грузовой
        Введите 2 - пассажирский
    TRAIN_TYPE
    command = gets.to_i
    case command
    when 1 then trains << CargoTrain.new(number, CARGO_TYPE)
    when 2 then trains << PassengerTrain.new(number, PASS_TYPE)
    else
      puts 'Команда введена не правильно'
    end
  end

  def create_route
    puts 'Выберите номер начальной станции'
    show_station_list
    start = @stations[gets.to_i]
    puts 'Выберите номер конечной станции'
    show_station_list
    finish = @stations[gets.to_i]
    routes << Route.new(start, finish)
  end

  def add_station_in_route
    route = get_route
    station = get_station
    route.add_station(station)
    route.put_stations_list
  end

  def del_station_in_route
    route = get_route
    station = get_station
    route.remove_station(station)
    route.put_stations_list
  end

  def take_route_for_train
    route = get_route
    train = get_train
    train.add_route(route)
  end

  def add_wagon_to_train
    train = get_train
    if train.type == CARGO_TYPE
      train.add_wagon(CargoWagon.new)
    else
      train.add_wagon(PassengerWagon.new)
    end
  end

  def move_train_route_forward
    train = get_train
    train.go_next_station
  end

  def move_train_route_back
    train = get_train
    train.go_previous_station
  end

  def show_information
    station = get_station
    station.put_trains_list
  end

  def show_station_for_train
    train = get_train
    train.route_point
    train.route.put_stations_list
  end

  protected

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

  def get_station
    puts 'Выберите станцию'
    show_station_list
    @stations[gets.to_i]
  end

  def get_route
    puts 'Выберите машрут'
    show_routes_list
    @routes[gets.to_i]
  end

  def get_train
    puts 'Выберите поезд'
    show_trains_list
    @trains[gets.to_i]
  end
end
