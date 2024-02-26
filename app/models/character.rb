class Character < ApplicationRecord
  has_many :fighters, -> {includes(:character)}
  validates_presence_of :origin
  validates_presence_of :origin_tag
  scope :origin_name , -> { order(origin: :asc) }

  after_validation :set_slug, only: [:create, :update]
  
  def to_param
    "#{id}-#{slug}"
  end
  private

  def set_slug
    self.slug = origin.to_s.parameterize
  end

end
