require 'pry'

class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = {}
  end

  def add_item(item, price, quantity = 1)
    @total +=  (price * quantity)
    quantity.times do
      @items << item
    end
    @transactions[item] = (price * quantity)
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total - (@total*@discount)/100
      return "After the discount, the total comes to $#{@total}."
    end
  end


  def void_last_transaction
    last_transaction = @transactions.values.last
    @total -= last_transaction
  end

end
