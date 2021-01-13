class CargoTrain < Train
  def initialize(number, type)
    super
    @type = CARGO_TYPE
  end
end
