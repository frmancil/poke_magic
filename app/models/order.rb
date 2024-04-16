class Order < ApplicationRecord
    belongs_to :order_status
    belongs_to :member
    belongs_to :item
    validates :order_number, presence: true, numericality: { only_integer: true }
    validates :is_completed, inclusion: [true, false]
    validates :price, presence: true, numericality: true
    validates :quantity, presence: true, numericality: { only_integer: true }
    validates :payment_link, presence: true, allow_nil: true
end
