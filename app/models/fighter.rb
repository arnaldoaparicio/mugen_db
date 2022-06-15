class Fighter < ApplicationRecord
  belongs_to :character
  has_many :fighter_variants
end
