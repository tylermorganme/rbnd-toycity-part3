require_relative "errors"

class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    if (@@customers.any? {|customer| customer.name == options[:name]})
      raise DuplicateCustomerError, "'#{options[:name]}' already exists."
    else
      @name = options[:name]
      @@customers << self
    end
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find {|customer| customer.name == name}
  end

  def purchase(product)
    Transaction.new(self, product)
  end
end
