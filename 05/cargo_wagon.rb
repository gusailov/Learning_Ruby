class CargoWagon
  include CompanyName
  attr_reader :total_volume

  def initialize(total_volume)
    @total_volume = total_volume
    @occupied_volume = 0
    @available_volume = volume
  end

  def fill_volume(vol)
    if @available_volume.zero?
      puts 'Весь объем занят'
    elsif @available_volume < vol
      puts "В вагоне осталось только '#{@available_volume}' свободного объема"
    else
      @available_volume -= vol
      @occupied_volume += vol
    end
  end

  def occupied_volume_qty
    @occupied_volume
  end

  def available_volume_qty
    @total_volume - @occupied_volume
  end
end
