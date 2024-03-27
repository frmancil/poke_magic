class Item < ApplicationRecord
    has_one_attached :image
    has_and_belongs_to_many :members
    belongs_to :item_type
    belongs_to :game_type
    belongs_to :game_edition
    validates :name, presence: true
    validates :rarity, presence: true
    validates :price, presence: true, numericality: true
    validates :stock, presence: true, numericality: { only_integer: true }

    def self.ransackable_attributes(auth_object = nil)
        ["name", "stock", "price", "rarity"]
      end
    
      def self.ransackable_associations(auth_object = nil)
        ["name", "stock", "price", "rarity"]
      end
end
