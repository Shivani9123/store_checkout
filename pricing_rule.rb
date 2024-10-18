class PricingRule
  attr_reader :product_code, :rule_type, :value1, :value2

  def initialize(product_code, rule_type, value1 = nil, value2 = nil)
    raise ArgumentError, "Product code cannot be nil" if product_code.nil? || product_code.empty?
    raise ArgumentError, "Rule type cannot be nil" if rule_type.nil?
    raise ArgumentError, "Value1 cannot be nil" if value1.nil?
    raise ArgumentError, "Value2 cannot be nil" if value2.nil?
    raise ArgumentError, "Value1 must be a positive integer" unless value1.is_a?(Integer) && value1 > 0
    raise ArgumentError, "Value2 must be a positive number" unless value2.is_a?(Numeric) && value2 > 0

    @product_code = product_code
    @rule_type = rule_type
    @value1 = value1
    @value2 = value2
  end
end
