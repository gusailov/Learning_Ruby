module CompanyName
  def set_company_name(name)
    self.company = name
  end

  def get_company_name
    company
  end

  protected

  attr_accessor :company
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    @@instances = 0

    def self.instances
      instances
    end

    def count
      @@instances += 1
      puts "count #{self}"
    end

    attr_accessor :instances
  end

  module InstanceMethods
    def register_instance
      self.class.count
      puts "register_instance self #{@@instances}"
    end
  end
end
