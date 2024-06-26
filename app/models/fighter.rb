class Fighter < ApplicationRecord
  belongs_to :character
  validates_presence_of :name
  validates_presence_of :name_tag
  has_many :fighter_variants , -> {includes(:fighter)}

  scope :alphabetical_name , -> { order(name: :asc) }

  after_validation :set_slug, only: [:create, :update]


  def to_param
    "#{id}-#{slug}"
  end
  private
  
  def set_slug
    self.slug = name_tag.to_s.parameterize
  end
end
