class FighterSerializer
  include JSONAPI::Serializer
  set_type :fighters
  attributes :name
end
