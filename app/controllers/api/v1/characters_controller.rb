class Api::V1::CharactersController < ApplicationController
  def index

    if params[:series_id].present? && params[:fighter_id].present?
      series = Character.find(params[:series_id])
      fighter = series.fighters.find(params[:fighter_id])
      variants = fighter.fighter_variants
      render json: FighterVariantSerializer.new(variants)
    else
      render json: CharacterSerializer.new(Character.all)
    end
  end

  def show
    character = Character.find(params[:id])
    render json: FighterSerializer.new(character.fighters)
  end

  def create
    character = Character.new(character_params)
    if character.save
      render json: CharacterSerializer.new(character), status: 201
    else
      render status: 400
    end
  end

  private

  def character_params
    params.require(:character).permit(:origin)
  end
end
