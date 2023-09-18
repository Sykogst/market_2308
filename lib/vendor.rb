class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 if @inventory[item] == nil
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] == nil ? @inventory[item] = amount : @inventory[item] += amount
  end
end