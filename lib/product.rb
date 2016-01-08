class Product
  @@products = []
  def initialize(options={})
    @@product << self
  end
  def self.all
    @@products
  end
end
