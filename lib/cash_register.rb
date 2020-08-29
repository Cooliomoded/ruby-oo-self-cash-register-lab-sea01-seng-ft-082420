require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :item_prices


    def initialize(discount=0)
        @items = []
        @total = 0.0
        @discount = discount
        @item_prices = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times{self.items << title}
        quantity.times{self.item_prices << price}
    end

    def apply_discount
        if @discount > 0
            self.total *= 0.8
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.item_prices.pop
        self.items.pop
        return self.total.round(2)
    end

end
