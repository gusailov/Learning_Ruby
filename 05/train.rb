class Train
  attr_reader :number, :type, :speed, :wagons, :route

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon unless wagons.include?(wagon) && wagon.type == type && @speed.zero?
  end

  def go_faster(speed)
    @speed += speed
  end

  def current_speed
    puts "Current speed: #{@speed} km/h"
  end

  def stop
    @speed = 0
  end

  def current_wagon_qty
    puts "Current wagon quantity: #{@wagons.length} PCS"
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
    puts "Previous station: #{previous_station.name}" if previous_station
    puts "Current station: #{current_station.name}"
    puts "Next station: #{next_station.name}" if next_station
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
