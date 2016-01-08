class Product
  attr_reader :title, :price, :stock

  @@products = []
  def initialize(options={})
    if (@@products.any? {|product| product.title == options[:title]})
      raise DuplicateProductError, "'#{options[:title]}' already exists."
    else
      @title = options[:title]
      @price = options[:price]
      @stock = options[:stock]
      @@products << self
    end
  end
  def self.all
    @@products
  end
end
