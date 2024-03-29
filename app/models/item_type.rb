class ItemType < ApplicationRecord
    has_many :items
    validates :name, presence: true, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        ["name"]
      end
    
      def self.ransackable_associations(auth_object = nil)
        ["name"]
      end
end
