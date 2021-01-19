class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def self.all
    @@stations
  end

  def take_train(train)
    @trains << train unless trains.include?(train)
    puts "Поезд №:#{train.number} прибыл на станцию #{name}"
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
    puts "Поезд №:#{train.number} покинул станцию #{name}"
  end

  def put_trains_list
    @trains.each do |train|
      puts "Поезд №: #{train.number}, тип: #{train.type}"
    end
  end

  protected

  def validate!
    raise 'ВВЕДИТЕ ИМЯ' if name.to_s.empty?
  end
end
