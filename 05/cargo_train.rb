class CargoTrain < Train
  include InstanceCounter
  
  def initialize(number)
    super(number, 'cargo')
    register_instance
  end

  def accept_class_wagon
    CargoWagon
  end
end
