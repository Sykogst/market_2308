require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor1 = Vendor.new('Rocky Mountain Fresh')
    @item1 = Item.new({name: 'Peach', price: '$0.75'})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'exists, has an instance' do
      expect(@vendor1).to be_instance_of(Vendor)
    end

    it 'has attributes upon initialize' do
      expect(@vendor1.name).to eq('Rocky Mountain Fresh')
      expect(@vendor1.inventory).to eq({})
    end
  end
end