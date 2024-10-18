class PricingRule
  attr_reader :product_code, :rule_type, :value1, :value2

  def initialize(product_code, rule_type, value1 = nil, value2 = nil)
    @product_code = product_code
    @rule_type = rule_type
    @value1 = value1
    @value2 = value2
  end
end
