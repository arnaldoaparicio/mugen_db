class Api::V1::FighterVariantsController < ApplicationController
  def new
  end

  def create
    fighter_variant = FighterVariant.new(fighter_variant_params)
    if fighter_variant.save
      # fighter_variant.avatar.attach(params["avatar"])
      # fighter_variant.avatar.attach(io: File.open(params["avatar"], filename: 'mugen20.png'))
      render json: FighterVariantSerializer.new(fighter_variant), status: 201
    else
      render status: 400
    end
  end

  private
  def fighter_variant_params
    params.require(:fighter_variant).permit(:name, :author, :website, :game_name, :fighter_id, :avatar)
  end
end
