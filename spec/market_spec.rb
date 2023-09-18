require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @market1 = Market.new('Belmar Market')

    @vendor1 = Vendor.new('Rocky Mountain Fresh')
    @vendor2 = Vendor.new('Ba-Nom-a-Nom')
    @vendor3 = Vendor.new('Palisade Peach Shack')  

    @item1 = Item.new({name: 'Peach', price: '$0.75'})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
    @item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})

    # Stock items into vendors (might move later)
    @vendor1.stock(@item1, 35) 
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50) 
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65) 
  end

  describe '#initialize' do
    it 'exists, has an instance' do
      expect(@market1).to be_instance_of(Market)
    end

    it 'has attributes upon initialize' do
      expect(@market1.name).to eq('Belmar Market')
      expect(@market1.vendors).to eq([])
    end
  end

  describe '#add_vendor, #vendor_names' do
    it 'Adds vendor to market vendors' do
      expect(@market1.vendors).to eq([])
      
      @market1.add_vendor(@vendor1)
      expect(@market1.vendors).to eq([@vendor1])

      @market1.add_vendor(@vendor2)
      @market1.add_vendor(@vendor3)
      expect(@market1.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end

    it 'Gets list of vendor names' do
      expect(@market1.vendors).to eq([])
      expect(@market1.vendor_names).to eq([])
      
      
      @market1.add_vendor(@vendor1)
      expect(@market1.vendor_names).to eq(['Rocky Mountain Fresh'])

      @market1.add_vendor(@vendor2)
      @market1.add_vendor(@vendor3)
      expect(@market1.vendor_names).to eq(['Rocky Mountain Fresh', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
    end
  end

  describe '#vendors_that_sell, #potential_revenue' do
    it "Gets list of vendors that sell a specific item" do
      expect(@market1.vendors_that_sell(@item1)).to eq([])

      @market1.add_vendor(@vendor1)
      @market1.add_vendor(@vendor2)
      @market1.add_vendor(@vendor3)

      expect(@market1.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market1.vendors_that_sell(@item4)).to eq([@vendor1, @vendor2])
      end
  
    end
  end
end