class DiscountCalculator
  attr_reader :discount, :quantity

  def initialize(discount, quantity)
    @discount = discount
    @quantity = quantity
  end

  def calculate_discount(qty)
    (qty / quantity).floor * discount
  end
end

class PriceManager
  attr_reader :price, :discounts

  def initialize(price, *discounts)
    @price = price
    @discounts = discounts
  end

  def get_price(qty)
    qty * price - get_discount(qty)
  end

  def get_discount(qty)
    discounts.inject(0) do | sum, discount |
      sum + discount.calculate_discount(qty)
    end
  end
end

RULES = {
  'A' => PriceManager.new(50, DiscountCalculator.new(20, 3)),
  'B' => PriceManager.new(30, DiscountCalculator.new(15, 2)),
  'C' => PriceManager.new(20),
  'D' => PriceManager.new(15)
}

class CheckOut
  attr_reader :rules, :products

  def initialize(rules)
    @rules = rules
    @products = Hash.new(0)
  end

  def total
    products.inject(0) do | sum, (product, qty) |
      sum + rules[product].get_price(qty)
    end
  end

  def scan(product)
    products[product] += 1
  end
end
