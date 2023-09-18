class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor| 
      vendor.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    all_items = @vendors.flat_map { |vendor| vendor.inventory.keys }.uniq
    all_items.sort_by { |item| item.name }
  end
end