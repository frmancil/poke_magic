class GameEdition < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
