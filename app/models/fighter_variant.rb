class FighterVariant < ApplicationRecord
    belongs_to :fighter

    has_one_attached :avatar

    def image_url
      if avatar.attached?
        avatar.blob.service_url
    end
  end

end
