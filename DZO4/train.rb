class Train
  attr_reader :number, :type, :current_station, :prev_station, :next_station
  attr_accessor :speed, :wagon_qty,  :route

  def initialize(number, wagon_qty = 0)
    @number = number
    puts 'type: cargo or pass?'
    type = gets.chomp
    @type = type
    @wagon_qty = wagon_qty
  end

  def wagon_increment
    if @speed.zero?
      @wagon_qty += 1
    else
      puts 'you must stop the train'
    end
  end

  def wagon_decrement
    if @speed.zero?
      @wagon_qty -= 1
    else
      puts 'you must stop the train'
    end
  end

  def add_route(route)
    @route = route
    @current_station = route.start
    @next_station = route.stations_list[1]
    @current_station.add_train(self)
  end

  def change_station_ff
    i = route.stations_list.index(@current_station)
    @prev_station = @current_station
    @current_station = route.stations_list[i + 1]
    @next_station = route.stations_list[i + 2]
    @current_station.add_train(self)
  end

  def change_station_rw
    i = route.stations_list.index(@current_station)
    @prev_station = @current_station
    @current_station = route.stations_list[i - 1]
    @next_station = route.stations_list[i - 2]
    @current_station.add_train(self)
  end
end
