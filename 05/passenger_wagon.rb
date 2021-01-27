class PassengerWagon
  include CompanyName
  include RandomNumber
  include Valid

  attr_reader :all_seats, :number, :occupied_seats

  @@wagons = {}

  def initialize(all_seats)
    @number = random_number
    @all_seats = all_seats
    validate!
    @@wagons[number] = self
    @occupied_seats = 0
  end

  def take_seat
    if free_seats.zero?
      puts 'Свободных мест нет'
    else
      @occupied_seats += 1
    end
    puts "Вагон номер : #{@number}," \
         "свободных мест : #{free_seats}, занятых мест : #{@occupied_seats}"
  end

  def free_seats
    @all_seats - @occupied_seats
  end

  def info
    puts "Вагон номер: #{number}, свободных мест: #{free_seats}, занятых мест: #{occupied_seats}"
  end

  protected

  def validate!
    raise 'Нужно ввести кол-во мест' if @all_seats.zero?
    raise 'Вагон с таким номером уже создан' if @@wagons.key?(number)
  end
end
