class PassengerWagon
  include CompanyName
  include RandomNumber

  attr_reader :all_seats, :number, :occupied_seats

  def initialize(all_seats)
    @number = random_number
    @all_seats = all_seats
    @occupied_seats = 0
  end

  def take_seat
    if @free_seats.zero?
      puts 'Свободных мест нет'
    else
      @occupied_seats += 1
    end
  end

  def free_seats
    @all_seats - @occupied_seats
  end
end
