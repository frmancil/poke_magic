class Cart < ApplicationRecord
    has_many :cart_items
    has_many :items, through: :cart_items

    def total
        cart_items.to_a.sum { |item| item.total}
    end

end
