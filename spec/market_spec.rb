require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @market1 = Market.new('Belmar Market')
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

  describe '#other stuff' do
  # before(:each) do
  #   @vendor1 = Vendor.new('Rocky Mountain Fresh')
  #   @item1 = Item.new({name: 'Peach', price: '$0.75'})
  #   @item2 = Item.new({name: 'Tomato', price: '$0.50'})

  #   @vendor2 = Vendor.new("Ba-Nom-a-Nom")

  #   @vendor3 = Vendor.new("Palisade Peach Shack")  
  # end
  end
end