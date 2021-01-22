class CargoWagon
  include CompanyName
  include RandomNumber

  attr_reader :total_volume, :occupied_volume, :number

  def initialize(total_volume)
    @number = random_number
    @total_volume = total_volume
    @occupied_volume = 0
  end

  def fill_volume(vol)
    if available_volume.zero?
      puts 'Весь объем занят'
    elsif available_volume < vol
      puts "В вагоне осталось только '#{available_volume}' свободного объема"
    else
      @occupied_volume += vol
    end
  end

  def available_volume
    @total_volume - @occupied_volume
  end
end
