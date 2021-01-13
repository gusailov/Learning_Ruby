class PassengerTrain < Train
  def initialize(number, type)
    super
    @type = PASS_TYPE
  end
end
