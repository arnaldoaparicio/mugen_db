class FighterVariant < ApplicationRecord
    belongs_to :fighter

    has_one_attached :avatar

end
