class GameType < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
