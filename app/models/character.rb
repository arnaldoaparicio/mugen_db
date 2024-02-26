class Character < ApplicationRecord
  has_many :fighters, -> {includes(:character)}
  validates_presence_of :origin
  validates_presence_of :origin_tag
  scope :origin_name , -> { order(origin: :asc) }

  after_validation :set_slug, only: [:create, :update]

  private

  def set_slug
    self.slug = origin_tag.to_s.parameterize
  end

end
