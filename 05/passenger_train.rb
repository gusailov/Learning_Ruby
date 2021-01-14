class PassengerTrain < Train
  def initialize(number)
    super(number, 'pass')
  end

  def accept_class_wagon
    PassengerWagon
  end
end
