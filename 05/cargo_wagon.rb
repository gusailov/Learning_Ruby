class CargoWagon
  include CompanyName
  include RandomNumber
  include Valid

  attr_reader :total_volume, :occupied_volume, :number

  @@wagons = {}

  def initialize(total_volume)
    @number = random_number
    @total_volume = total_volume
    validate!
    @occupied_volume = 0
    @@wagons[number] = self
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

  protected

  def validate!
    raise 'Нужно ввести объем' if @total_volume.zero?
    raise 'Вагон с таким номером уже создан' if @@wagons.key?(number)
  end
end
