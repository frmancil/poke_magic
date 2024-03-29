class GameType < ApplicationRecord
    has_many :items
    has_many :trades
    validates :name, presence: true, uniqueness: true
end
