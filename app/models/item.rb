class Item < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
        ["name", "stock", "price", "rarity"]
      end
    
      def self.ransackable_associations(auth_object = nil)
        ["name", "stock", "price", "rarity"]
      end
end
