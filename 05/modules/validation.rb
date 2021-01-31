module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validate(*attr_names, **args)
      types = args.keys
      types.each do |type|
        validation = { type => { attributes: attr_names, arg: args[type] } }
        validations << validation
      end
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def validate!
      puts "self.class.validations #{self.class.validations}"
      self.class.validations.each do |validation|
        validation.each do |type, options|
          options[:attributes].each do |attr_name|
            send("validate_#{type}_of", attr_name, options[:arg])
          end
        end
      end
    end

    def validate_presence_of(attr_name, _arg)
      raise "Нужно ввести #{attr_name} " if send(attr_name).to_s.empty?
    end

    def validate_format_of(attr_name, arg)
      raise "Формат атрибута #{attr_name}- неверный" if send(attr_name).to_s !~ arg
    end

    def validate_attr_type_of(attr_name, arg)
      puts "validate_type_of #{send(attr_name)}...#{send(attr_name).class} аданному (#{arg})"
      unless send(attr_name).instance_of?(arg)
        raise "Тип атрибута #{attr_name}- не соответствует заданному (#{arg})"
      end
    end
  end
end
