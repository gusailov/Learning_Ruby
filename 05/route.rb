class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(start, finish)
    @start = start
    @finish = finish
    @stations = [start, finish]
    register_instance
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

  # def validate!
  #   raise 'Начальная и конечная станции не могут совпадать' if @start == @finish
  #   if !@start.instance_of?(Station) || !@finish.instance_of?(Station)
  #     raise 'В маршрут могут быть добавлены ТОЛЬКО станции'
  #   end
  # end
end
