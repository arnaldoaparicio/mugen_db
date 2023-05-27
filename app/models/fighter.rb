class Fighter < ApplicationRecord
  belongs_to :character
  validates_presence_of :name
  has_many :fighter_variants , -> {includes(:fighter)}

  scope :alphabetical_name , -> { order(name: :asc) }
end
