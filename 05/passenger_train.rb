class PassengerTrain < Train
  # include InstanceCounter
  @@instances = 0
  def initialize(number)
    super(number, 'pass')
    @@instances += 1
    # register_instance
  end

  def self.instances
    @@instances
  end

  def accept_class_wagon
    PassengerWagon
  end
end
