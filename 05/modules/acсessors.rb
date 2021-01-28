module Acсessors
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          @values = []
          instance_variable_set(var_name, value)
          @values << value
        end
      end
    end
  end

  module InstanceMethods
    def values
      @values ||= []
    end
  end
end
