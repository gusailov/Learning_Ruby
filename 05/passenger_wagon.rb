class PassengerWagon < Wagon
  attr_reader :type

  def initialize
    super
    @type = PASS_TYPE
  end
end
