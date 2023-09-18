class Item
  attr_reader :name

  def initialize(item_info)
    @name = item_info[:name]
    @price = item_info[:price]
  end

  def price
    @price.delete('$').to_f.round(2)
  end
end