class Cart < ApplicationRecord
    has_many :cart_items
    has_many :items, through: :cart_items

    def total
        cart_items.to_a.sum { |item| item.total}
    end

    def total_after_taxes
        cart_items.to_a.sum { |item| item.total + (item.total * ((Member.current.province.GST + Member.current.province.PST + Member.current.province.HST)/100)).round(2) }
    end

end
