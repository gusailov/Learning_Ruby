class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train unless trains.include?(train)
    puts "Train came to station: #{name}"
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
    puts "Train gone from station: #{name}"
  end

  def put_trains_list
    @trains.each do |train|
      puts "Train number: #{train.number}, type: #{train.type}"
    end
  end
end
