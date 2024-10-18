class Checkout
  require_relative 'pricing_rule'

  def initialize(pricing_rules = {})
    @cart = Hash.new(0)
    @pricing_rules = pricing_rules
    @products = {
      "VOUCHER" => Product.new("VOUCHER", "Voucher", 5.00),
      "TSHIRT" => Product.new("TSHIRT", "T-Shirt", 20.00),
      "MUG" => Product.new("MUG", "Coffee Mug", 7.50)
    }
  end

  def add_item(item)
    @cart[item] += 1
  end

  def total
    total_amount = 0

    @cart.each do |item, quantity|
      product = find_product(item)
      pricing_rules = find_pricing_rules(item)

      total_amount += calculate_best_pricing(product, quantity, pricing_rules)
    end

    total_amount
  end

  def reset_cart
    @cart = Hash.new(0)
  end

  private

  def find_product(item)
    @products[item]
  end

  def find_pricing_rules(item)
    @pricing_rules[item] || []
  end

  def calculate_best_pricing(product, quantity, pricing_rules)
    return product.price * quantity if pricing_rules.empty?

    best_price = Float::INFINITY

    pricing_rules.each do |rule|
      price = case rule.rule_type
              when 'x_for_y'
                calculate_x_for_y(product.price, quantity, rule.value1, rule.value2)
              when 'bulk_discount'
                calculate_bulk_discount(product.price, quantity, rule.value1, rule.value2)
              else
                product.price * quantity
              end

      best_price = [best_price, price].min
    end

    best_price
  end

  def calculate_x_for_y(price, quantity, threshold, charged_items)
    full_price_items = quantity / threshold
    remainder_items = quantity % threshold
    (full_price_items * charged_items + remainder_items) * price
  end

  def calculate_bulk_discount(price, quantity, threshold, discounted_price)
    if quantity >= threshold
      quantity * discounted_price
    else
      quantity * price
    end
  end
end

class PricingRule
  attr_reader :product_code, :rule_type, :value1, :value2

  def initialize(product_code, rule_type, value1 = nil, value2 = nil)
    @product_code = product_code
    @rule_type = rule_type
    @value1 = value1
    @value2 = value2
  end
end

class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end

# Example usage:
pricing_rules = {
  "VOUCHER" => [PricingRule.new("VOUCHER", "x_for_y", 2, 1)],
  "TSHIRT" => [PricingRule.new("TSHIRT", "bulk_discount", 3, 19.00)]
}

co = Checkout.new(pricing_rules)

puts "Items: VOUCHER, TSHIRT, MUG"
co.add_item('VOUCHER')
co.add_item('TSHIRT')
co.add_item('MUG')
puts "Total: #{co.total}"

puts "Items: VOUCHER, TSHIRT, VOUCHER"
co.reset_cart
co.add_item('VOUCHER')
co.add_item('TSHIRT')
co.add_item('VOUCHER')
puts "Total: #{co.total}"

puts "Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT"
co.reset_cart
co.add_item('TSHIRT')
co.add_item('TSHIRT')
co.add_item('TSHIRT')
co.add_item('VOUCHER')
co.add_item('TSHIRT')
puts "Total: #{co.total}"

puts "Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT"
co.reset_cart
co.add_item('VOUCHER')
co.add_item('TSHIRT')
co.add_item('VOUCHER')
co.add_item('VOUCHER')
co.add_item('MUG')
co.add_item('TSHIRT')
co.add_item('TSHIRT')
puts "Total: #{co.total}"
