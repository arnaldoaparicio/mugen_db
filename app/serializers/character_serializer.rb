class CharacterSerializer
  include JSONAPI::Serializer
  set_type :characters
  attributes :origin, :origin_tag
end
