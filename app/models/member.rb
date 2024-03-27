class Member < ApplicationRecord
    has_and_belongs_to_many :items
    has_many :orders
    validates :full_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :address, presence: true
    validates :store_credit_available, presence: true, numericality: true
end
