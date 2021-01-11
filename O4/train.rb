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

  def add_route(route)
    @route = route
    @index_station = 0
    @current_station = route.stations[@index_station]
    @current_station.take_train(self)
  end

  def change_station
    @prev_station = @current_station
    @current_station = route.stations[@index_station]
    @prev_station.send_train(self)
    @current_station.take_train(self)
  end

  def change_station_ff
    @index_station += 1 if (@index_station + 1) < route.stations.length
    change_station
  end

  def change_station_rw
    @index_station -= 1 if @index_station.positive?
    change_station
  end

  def route_point
    puts "Previous station: #{route.stations[@index_station - 1].name}" if @index_station.positive?
    puts "Current station: #{route.stations[@index_station].name}"
    puts "Next station: #{route.stations[@index_station + 1].name}" if (@index_station + 1) < route.stations.length
  end
end
