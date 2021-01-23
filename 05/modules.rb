require 'securerandom'

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

module Valid
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    def increment_instances
      @instances = instances + 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.increment_instances
    end
  end
end

module RandomNumber
  def random_number
    "#{rand(100..999)}-#{SecureRandom.alphanumeric(3).upcase}"
    # rand(100..999).to_s
  end
end
