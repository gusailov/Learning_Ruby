class PassengerWagon
  include CompanyName

  attr_reader :all_seats

  def initialize(seats)
    @all_seats = seats
    @occupied_seats = 0
    @free_seats = seats
  end

  def take_seat
    if @free_seats.zero?
      puts 'Свободных мест нет'
    else
      @free_seats -= 1
      @occupied_seats += 1
    end
  end

  def occupied_seats_num
    @occupied_seats
  end

  def free_seats_num
    @free_seats
  end
end
