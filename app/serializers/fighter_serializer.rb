class FighterSerializer
  include JSONAPI::Serializer
  set_type :fighters
  attributes :name

  attribute :slug_url do |object|
    object.to_param
  end
end
