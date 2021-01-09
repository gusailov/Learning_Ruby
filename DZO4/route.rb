class Route
  attr_reader :stations_list

  def initialize(start, finish)
    @stations_list = [start, finish]
  end

  def add_station(station)
    @stations_list.insert(1, station) unless @stations_list.include?(station)
  end

  def remove_station(station)
    @stations_list.delete(station)
  end

  def put_stations_list
    @stations_list.each do |station|
      puts "Station: #{station} - #{station.name}"
    end
    nil
  end
end
