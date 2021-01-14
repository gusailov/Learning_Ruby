class PassengerTrain < Train
  def initialize(number)
    super
    @type = PASS_TYPE
  end

  def accept_class_wagon
    PassengerWagon
  end
end
