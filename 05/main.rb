require_relative 'station'
require_relative 'route'
require_relative 'train'

class RailRoad
  attr_reader :stations, :trains, :routes

  def seed
    st1 = Station.new('a')
    st2 = Station.new('b')
    st3 = Station.new('c')
    st4 = Station.new('d')
    st5 = Station.new('e')

    t1 = Train.new(1, 'cargo', 15)
    t2 = Train.new(2, 'cargo', 15)
    t3 = Train.new(3, 'cargo', 15)

    r1 = Route.new(st1, st5)
    r2 = Route.new(st4, st2)

    @stations = [st1, st2, st3, st4, st5]
    @trains = [t1, t2, t3]
    @routes = [r1, r2]
  end
end
