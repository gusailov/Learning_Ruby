class PassengerTrain < Train
  def initialize(number)
    super(number, 'pass')
  end

  protected

  def accept_class_wagon
    PassengerWagon
  end
end
