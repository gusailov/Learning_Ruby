class CargoTrain < Train
  def initialize(number)
    super
    @type = CARGO_TYPE
  end

  def accept_class_wagon
    CargoWagon
  end
end
