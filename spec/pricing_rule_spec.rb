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

  describe 'negative scenarios' do
    it 'raises an error when product_code is nil' do
      expect { PricingRule.new(nil, "x_for_y", 2, 1) }.to raise_error(ArgumentError, "Product code cannot be nil")
    end

    it 'raises an error when product_code is an empty string' do
      expect { PricingRule.new("", "x_for_y", 2, 1) }.to raise_error(ArgumentError, "Product code cannot be nil")
    end

    it 'raises an error when rule_type is nil' do
      expect { PricingRule.new("VOUCHER", nil, 2, 1) }.to raise_error(ArgumentError, "Rule type cannot be nil")
    end

    it 'raises an error when value1 is nil' do
      expect { PricingRule.new("VOUCHER", "x_for_y", nil, 1) }.to raise_error(ArgumentError, "Value1 cannot be nil")
    end

    it 'raises an error when value2 is nil' do
      expect { PricingRule.new("VOUCHER", "x_for_y", 2, nil) }.to raise_error(ArgumentError, "Value2 cannot be nil")
    end

    it 'raises an error when value1 is not a positive integer for x_for_y' do
      expect { PricingRule.new("VOUCHER", "x_for_y", -1, 1) }.to raise_error(ArgumentError, "Value1 must be a positive integer")
    end

    it 'raises an error when value1 is not a positive integer for bulk_discount' do
      expect { PricingRule.new("TSHIRT", "bulk_discount", -1, 19.00) }.to raise_error(ArgumentError, "Value1 must be a positive integer")
    end

    it 'raises an error when value2 is not a positive number' do
      expect { PricingRule.new("VOUCHER", "x_for_y", 2, -1) }.to raise_error(ArgumentError, "Value2 must be a positive number")
    end
  end
end
