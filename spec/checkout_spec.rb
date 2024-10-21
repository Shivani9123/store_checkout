require_relative '../checkout'
require_relative '../pricing_rule'
require_relative '../product'

RSpec.describe Checkout do
  let(:pricing_rules) do
    {
      "VOUCHER" => [PricingRule.new("VOUCHER", "x_for_y", 2, 1)],
      "TSHIRT" => [PricingRule.new("TSHIRT", "bulk_discount", 3, 19.00)]
    }
  end
  let(:checkout) { Checkout.new(pricing_rules) }

  before do
    checkout.reset_cart
  end

  describe '#add_item' do
    it 'adds items to the cart' do
      checkout.add_item('VOUCHER')
      expect(checkout.instance_variable_get(:@cart)['VOUCHER']).to eq(1)
    end
  end

  describe '#total' do
    it 'calculates the correct total for VOUCHER, TSHIRT, MUG' do
      checkout.add_item('VOUCHER')
      checkout.add_item('TSHIRT')
      checkout.add_item('MUG')
      expect(checkout.total).to eq(32.50)
    end

    it 'calculates the correct total for VOUCHER, TSHIRT, VOUCHER' do
      checkout.add_item('VOUCHER')
      checkout.add_item('TSHIRT')
      checkout.add_item('VOUCHER')
      expect(checkout.total).to eq(25.00)
    end

    it 'calculates the correct total for TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT' do
      checkout.add_item('TSHIRT')
      checkout.add_item('TSHIRT')
      checkout.add_item('TSHIRT')
      checkout.add_item('VOUCHER')
      checkout.add_item('TSHIRT')
      expect(checkout.total).to eq(81.00)
    end

    it 'calculates the correct total for a larger set of items' do
      checkout.add_item('VOUCHER')
      checkout.add_item('TSHIRT')
      checkout.add_item('VOUCHER')
      checkout.add_item('VOUCHER')
      checkout.add_item('MUG')
      checkout.add_item('TSHIRT')
      checkout.add_item('TSHIRT')
      expect(checkout.total).to eq(74.50)
    end
  end
end
