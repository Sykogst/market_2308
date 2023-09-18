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

  def item_counts
    # Hash of {item => total inventory}
    @vendors.reduce(Hash.new(0)) do |item_amounts, vendor|
      vendor.inventory.each do |item, amount|
        item_amounts[item] += amount
      end
      item_amounts
    end
  end

  def total_inventory
    final_hash = {}
    item_counts.each do |item, total|
      final_hash[item] = Hash[quantity: total, vendors: vendors_that_sell(item)]
    end
    final_hash
  end
end