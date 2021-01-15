module CompanyName
  def get_company_name
    company_name
  end

  def set_company_name(name)
    self.company_name = name
  end

  attr_accessor :company_name
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def class.initialize
      puts 'ClassMethods test initialize'
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
