module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *params)
      case type
      when :presence
        !name.empty?
      when :format
        !(name !~ params.first)
      when :type
        name.instance_of?(params.first)
      else
        puts 'Тип валидации задан неверно'
      end
    end
  end

  module InstanceMethods
    def validate!
      puts "Тип валидации #{params[:validate]}"
      self.class.send(:validate, *args)
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
