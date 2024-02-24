class Character < ApplicationRecord
  has_many :fighters, -> {includes(:character)}
  validates_presence_of :origin
  validates_presence_of :origin_tag
  scope :origin_name , -> { order(origin: :asc) }
end
