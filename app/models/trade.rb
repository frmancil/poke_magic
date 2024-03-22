class Trade < ApplicationRecord
    validates :name, presence: true
    validates :rarity, presence: true
    validates :store_credit, presence: true, numericality: true
    validates :quantity_expected, presence: true, numericality: { only_integer: true }
end
