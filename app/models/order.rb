class Order < ApplicationRecord
    has_many :order_statuses
    belongs_to :member
    validates :order_number, presence: true, numericality: { only_integer: true }
    validates :is_completed, presence: true, inclusion: [true, false]
    validates :price, presence: true, numericality: true
    validates :quantity, presence: true, numericality: { only_integer: true }
    validates :payment_link, presence: true
end
