class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
end