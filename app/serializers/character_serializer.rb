class CharacterSerializer
  include JSONAPI::Serializer
  set_type :characters
  attributes :origin, :series_fighters

  # has_many :fighters, include_data: true
end
