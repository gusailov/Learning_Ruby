class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(start, finish)
    @start = start
    @finish = finish
    @stations = [start, finish]
    register_instance
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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

  protected

  def validate!
    raise 'Начальная и конечная станции не могут совпадать' if @start == @finish
  end
end
