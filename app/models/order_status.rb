class OrderStatus < ApplicationRecord
    belongs_to :order
    validates :status, presence: true, uniqueness: true
end
