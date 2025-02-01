class Product
  attr_accessor :price

  @@product_count = 0

  def initialize(price = 0.0)
    @price = price
    @@product_count += 1
  end

  def self.exclusive # returns the instance of a class (Factory method)
    Product.new(45.0) 
  end

  def self.product_count
    @@product_count
  end
    
end

