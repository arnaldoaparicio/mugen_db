class Fighter < ApplicationRecord
  belongs_to :character
  has_many :fighter_variants

  scope :alphabetical_name , -> { order(name: :asc) }
end
