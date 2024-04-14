class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :item_type
    belongs_to :rarity
    belongs_to :game_type
    has_many :cart_items
    has_many :carts, through: :cart_items
    validates :name, presence: true
    validates :price, presence: true, numericality: true
    validates :stock, presence: true, numericality: { only_integer: true }

    def self.ransackable_attributes(auth_object = nil)
        ["name", "stock", "price"]
      end
    
      def self.ransackable_associations(auth_object = nil)
        ["name", "stock", "price"]
      end
end
