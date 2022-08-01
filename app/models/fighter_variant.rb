class FighterVariant < ApplicationRecord
  belongs_to :fighter

  has_one_attached :avatar

  def image_url
    avatar.blob.service_url if avatar.attached?
  end
end
