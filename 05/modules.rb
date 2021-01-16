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
    @@inst = 0
    def self.initialize
      super
      @@inst += 1
      puts "self.initialize #{self}"
    end

    def get_inst
      @@inst
    end

    def test
      puts "ClassMethods test #{self}"
    end
  end

  module InstanceMethods
    def test
      puts "InstanceMethods test #{self}"
    end
  end
end
