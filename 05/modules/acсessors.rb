module Acсessors
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def values
      @values ||= {}
    end

    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        values[var_name] ||= []
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          values[var_name] << value
          instance_variable_set(var_name, value)
        end
        define_method("#{name}_history") { values[var_name] }
      end
    end

    def strong_attr_accessor(name, cl)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        raise 'Тип указанного значения не соответствует заданному' if value.class != cl

        instance_variable_set(var_name, value)
      end
    end
  end

  module InstanceMethods
    def values
      self.class.values
    end
  end
end
