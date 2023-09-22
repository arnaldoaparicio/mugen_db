class FighterVariant < ApplicationRecord
  belongs_to :fighter

  validates_presence_of :name
  validates_presence_of :author
  validates_presence_of :website
  validates_presence_of :game_name

  has_one_attached :avatar

  def image_url
    avatar.blob.url if avatar.attached?
  end
end
