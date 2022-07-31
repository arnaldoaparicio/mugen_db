class FighterVariantSerializer
  include JSONAPI::Serializer
  attributes :name, :author, :website, :game_name, :image, :image_url
end
