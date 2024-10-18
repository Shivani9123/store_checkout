class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    raise ArgumentError, "Code cannot be nil or empty" if code.nil? || code.empty?
    raise ArgumentError, "Name cannot be nil or empty" if name.nil? || name.empty?
    raise ArgumentError, "Price must be a positive number" if price.nil? || price <= 0

    @code = code
    @name = name
    @price = price
  end
end
