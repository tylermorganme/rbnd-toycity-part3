class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    if product.in_stock? then
      @id = @@transactions.length + 1
      @customer = customer
      @product = product
      @@transactions << self
      product.purchase
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find {|transaction| transaction.id == id}
  end

end
