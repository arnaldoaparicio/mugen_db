class Fighter < ApplicationRecord
    validates_presence_of :name
    belongs_to :character
    has_many :fighter_variants
end
