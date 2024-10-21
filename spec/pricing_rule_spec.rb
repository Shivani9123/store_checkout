require_relative '../pricing_rule'

RSpec.describe PricingRule do
  let(:rule_1) { PricingRule.new("VOUCHER", "x_for_y", 2, 1) }
  let(:rule_2) { PricingRule.new("TSHIRT", "bulk_discount", 3, 19.00) }
  let(:rule_3) { PricingRule.new("MUG", "x_for_y", 5, 2) }

  describe '#initialize' do
    it 'initializes with correct attributes for x_for_y rule' do
      expect(rule_1.product_code).to eq("VOUCHER")
      expect(rule_1.rule_type).to eq("x_for_y")
      expect(rule_1.value1).to eq(2)
      expect(rule_1.value2).to eq(1)
    end

    it 'initializes with correct attributes for bulk_discount rule' do
      expect(rule_2.product_code).to eq("TSHIRT")
      expect(rule_2.rule_type).to eq("bulk_discount")
      expect(rule_2.value1).to eq(3)
      expect(rule_2.value2).to eq(19.00)
    end

    it 'initializes with correct attributes for another x_for_y rule' do
      expect(rule_3.product_code).to eq("MUG")
      expect(rule_3.rule_type).to eq("x_for_y")
      expect(rule_3.value1).to eq(5)
      expect(rule_3.value2).to eq(2)
    end
  end
end
