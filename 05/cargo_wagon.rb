class CargoWagon
  include CompanyName
  include RandomNumber

  attr_reader :total_volume, :occupied_volume, :number

  @@wagons = {}

  def initialize(total_volume)
    @number = random_number
    @total_volume = total_volume
    @@wagons[number] = self
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
    info
  end

  def available_volume
    @total_volume - @occupied_volume
  end

  def info
    puts "Вагон номер: #{number}," \
    "свободный объем: #{available_volume}, занятый объем: #{occupied_volume}"
  end

  # def validate!
  #   raise 'Нужно ввести объем' if @total_volume.zero?
  #   raise 'Вагон с таким номером уже создан' if @@wagons.key?(number)
  # end
end
