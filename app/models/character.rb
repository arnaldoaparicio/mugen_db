class Character < ApplicationRecord
  has_many :fighters, -> {includes(:character)}
  validates_presence_of :origin
  scope :origin_name , -> { order(origin: :asc) }
end
