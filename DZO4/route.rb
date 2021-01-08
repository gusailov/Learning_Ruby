class Route
  attr_reader :start, :finish, :stations_list

  def initialize(start, finish)
    @start = start
    @finish = finish
    @stations_list = [@start, @finish]
  end

  def add_station(station)
    @stations_list.insert(1, station) unless @stations_list.include?(station)
  end

  def remove_station(station)
    @stations_list.delete(station)
  end
end
