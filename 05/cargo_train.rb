class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
  end

  protected

  def accept_class_wagon
    CargoWagon
  end
end
