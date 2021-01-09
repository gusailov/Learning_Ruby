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

  def put_trains_list
    @trains.each do |train|
      puts "Train on station: #{train} - #{train.number}"
    end
    nil
  end

  def trains_by_type(type)
    selected = @trains.select { |train| train.type == type }
    selected.each do |train|
      puts "#{type} trains on station: #{train} - #{train.number}"
    end
    nil
  end

  def send_train(train)
    @trains.delete(train)
    puts "Train gone from station: #{name}"
  end
end
