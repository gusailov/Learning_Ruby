class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def remove_station(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def put_stations_list
    puts "Станции маршрута #{self}"
    @stations.each_with_index do |station, index|
      puts "Станция: #{index} - #{station.name}"
    end
  end
end
