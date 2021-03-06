class Station
  include InstanceCounter
  include Valid
  attr_reader :name, :trains

  @@stations = []
  NAME_FORMAT = /^\S+$/.freeze

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def take_train(train)
    @trains << train unless trains.include?(train)
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def put_trains_list
    @trains.each do |train|
      puts "Поезд №: #{train.number}, тип: #{train.type}"
    end
  end

  def each_trains
    @trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise 'ВВЕДИТЕ ИМЯ' if name.to_s.empty?
    raise 'В имени не должно быть пробелов, используйте "_"' if name !~ NAME_FORMAT
  end
end
