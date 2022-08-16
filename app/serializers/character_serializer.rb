class CharacterSerializer
  include JSONAPI::Serializer
  set_type :characters
  attributes :origin, :series_fighters
end
