class PassengerWagon
  include CompanyName
  include RandomNumber

  attr_reader :all_seats, :number, :occupied_seats

  @@wagons = {}

  def initialize(all_seats)
    @number = random_number
    @all_seats = all_seats
    @@wagons[number] = self
    @occupied_seats = 0
  end

  def self.all
    @@wagons
  end

  def take_seat
    if free_seats.zero?
      puts 'Свободных мест нет'
    else
      @occupied_seats += 1
    end
    info
  end

  def free_seats
    @all_seats - @occupied_seats
  end

  def info
    puts "Вагон номер: #{number}, свободных мест: #{free_seats}, занятых мест: #{occupied_seats}"
  end

  # def validate!
  #   raise 'Нужно ввести кол-во мест' if @all_seats.zero?
  #   raise 'Вагон с таким номером уже создан' if @@wagons.key?(number)
  # end
end
