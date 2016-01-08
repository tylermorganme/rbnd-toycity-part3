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

  def self.find_by_title(title)
    @@products.find {|product| product.title == title}
  end

  def self.in_stock
    @@products.find_all {|product| product.in_stock?}
  end

  def in_stock?
    @stock > 0
  end

end
