class Train
  attr_reader :number, :type, :speed, :wagon_qty, :route

  def initialize(number, type, wagon_qty = 0)
    @number = number
    @type = type
    @wagon_qty = wagon_qty
    @speed = 0
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
    puts "Current wagon quantity: #{@wagon_qty} PCS"
  end

  def add_wagon
    @wagon_qty += 1 if @speed.zero?
  end

  def remove_wagon
    @wagon_qty -= 1 if @speed.zero? && wagon_qty.positive?
  end

  def current_station
    route.stations[@index_station]
  end

  def next_station
    route.stations[@index_station + 1] if (@index_station + 1) < route.stations.length
  end

  def previous_station
    route.stations[@index_station - 1] if @index_station.positive?
  end

  def station_take_train
    current_station.take_train(self)
  end

  def station_send_train
    current_station.send_train(self)
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
    puts "Previous station: #{previous_station}" if previous_station
    puts "Current station: #{current_station}"
    puts "Next station: #{next_station}" if next_station
  end
end
