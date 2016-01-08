class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    @id = @@transactions.length + 1
    @customer = customer
    @product = product
    process_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find {|transaction| transaction.id == id}
  end

  def process_transaction
    if product.in_stock? then
      @@transactions << self
      product.purchase
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end

  def self.total_sales
    @@transactions.inject(0) {|sales, transaction|
      sales + transaction.product.price
    }
  end

end
