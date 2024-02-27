class CharacterSerializer
  include JSONAPI::Serializer
  set_type :characters
  attributes :origin, :origin_tag

  attribute :slug_url do |object|
    object.to_param
  end
end
