class Train
  include InstanceCounter
  include CompanyName
  attr_reader :number, :type, :speed, :wagons, :route

  @@trains = {}

  def initialize(number, type)
    @number = number
    @wagons = []
    @speed = 0
    @type = type
    @@trains[self.number] = self
    register_instance
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def self.find(num)
    @@trains[num]
  end

  def add_wagon(wagon)
    if @speed.zero?
      @wagons << wagon if wagon.instance_of?(accept_class_wagon)
    else
      puts 'Вы должны остановить поезд'
    end
  end

  def remove_wagon
    @wagons.pop if @speed.zero? && !wagons.empty
  end

  def go_faster(speed)
    @speed += speed
  end

  def current_speed
    puts "Текущая скорость: #{@speed} км/ч"
  end

  def stop
    @speed = 0
  end

  def current_wagon_qty
    puts "Текущее кол-во вагонов: #{@wagons.length}шт."
  end

  def add_route(route)
    @route = route
    @index_station = 0
    station_take_train
  end

  def go_next_station
    if next_station
      station_send_train
      @index_station += 1
      station_take_train
    end
  end

  def go_previous_station
    if previous_station
      station_send_train
      @index_station -= 1
      station_take_train
    end
  end

  def route_point
    puts "Предыдущая станция: #{previous_station.name}" if previous_station
    puts "В данный момент поезд на станции: #{current_station.name}"
    puts "Следующая станция: #{next_station.name}" if next_station
  end

  protected

  def validate!
    raise 'NUMBEEERR' if number.nil?
  end

  private

  # вызывается внутри других методов Класса
  def station_take_train
    current_station.take_train(self)
  end

  # вызывается внутри других методов Класса
  def station_send_train
    current_station.send_train(self)
  end

  # промежуточный метод для определяния текущей станции
  def current_station
    route.stations[@index_station]
  end

  # промежуточный метод для определяния следующей станции
  def next_station
    route.stations[@index_station + 1] if (@index_station + 1) < route.stations.length
  end

  # промежуточный метод для определяния предыдущей станции
  def previous_station
    route.stations[@index_station - 1] if @index_station.positive?
  end
end
