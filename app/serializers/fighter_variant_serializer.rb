class FighterVariantSerializer
  include JSONAPI::Serializer
  attributes :name, :author, :website, :game_name, :image_url
end
