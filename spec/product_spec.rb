require_relative '../product'

RSpec.describe Product do
  let(:product_1) { Product.new("VOUCHER", "Voucher", 5.00) }
  let(:product_2) { Product.new("TSHIRT", "T-Shirt", 20.00) }
  let(:product_3) { Product.new("MUG", "Coffee Mug", 7.50) }

  describe '#initialize' do
    it 'initializes product_1 with correct attributes' do
      expect(product_1.code).to eq("VOUCHER")
      expect(product_1.name).to eq("Voucher")
      expect(product_1.price).to eq(5.00)
    end

    it 'initializes product_2 with correct attributes' do
      expect(product_2.code).to eq("TSHIRT")
      expect(product_2.name).to eq("T-Shirt")
      expect(product_2.price).to eq(20.00)
    end

    it 'initializes product_3 with correct attributes' do
      expect(product_3.code).to eq("MUG")
      expect(product_3.name).to eq("Coffee Mug")
      expect(product_3.price).to eq(7.50)
    end
  end

  describe 'negative scenarios' do
    it 'raises an error when code is nil' do
      expect { Product.new(nil, "Voucher", 5.00) }
        .to raise_error(ArgumentError, "Code cannot be nil or empty")
    end

    it 'raises an error when name is nil' do
      expect { Product.new("VOUCHER", nil, 5.00) }
        .to raise_error(ArgumentError, "Name cannot be nil or empty")
    end

    it 'raises an error when price is nil' do
      expect { Product.new("VOUCHER", "Voucher", nil) }
        .to raise_error(ArgumentError, "Price must be a positive number")
    end

    it 'raises an error when price is a negative value' do
      expect { Product.new("VOUCHER", "Voucher", -5.00) }
        .to raise_error(ArgumentError, "Price must be a positive number")
    end

    it 'raises an error when code is an empty string' do
      expect { Product.new("", "Voucher", 5.00) }
        .to raise_error(ArgumentError, "Code cannot be nil or empty")
    end

    it 'raises an error when name is an empty string' do
      expect { Product.new("VOUCHER", "", 5.00) }
        .to raise_error(ArgumentError, "Name cannot be nil or empty")
    end

    it 'raises an error when price is zero' do
      expect { Product.new("VOUCHER", "Voucher", 0) }
        .to raise_error(ArgumentError, "Price must be a positive number")
    end
  end
end
