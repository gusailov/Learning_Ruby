class CargoWagon < Wagon
  attr_reader :type

  def initialize
    super
    @type = CARGO_TYPE
  end
end
