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
          puts "values before#{values}"
          values[var_name] << value
          puts "values after#{values}"
          instance_variable_set(var_name, value)
        end
        define_method("#{name}_history") { values[var_name] }
      end
    end
  end

  module InstanceMethods
    def values
      self.class.values
    end
  end
end
