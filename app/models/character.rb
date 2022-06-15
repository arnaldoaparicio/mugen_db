class Character < ApplicationRecord
  has_many :fighters

  def series_fighters
    fighters.each do |fighter|
      fighter.name
    end
  end
end
