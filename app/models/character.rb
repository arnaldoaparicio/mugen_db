class Character < ApplicationRecord
  has_many :fighters
  validates_presence_of :origin
  scope :origin_name , -> { order(origin: :asc) }

  def series_fighters
    fighters.each do |fighter|
      fighter.name
    end
  end
end
