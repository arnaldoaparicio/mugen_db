class Api::V1::CharactersController < ApplicationController
  def index
    if params[:series_id].present? && params[:fighter_id].present?
      series = Character.find(params[:series_id])
      fighter = series.fighters.find(params[:fighter_id])
      variants = fighter.fighter_variants
      render json: FighterVariantSerializer.new(variants)
    else
      render json: CharacterSerializer.new(Character.all.origin_name), status: 200
    end
  end

  def show
    character = Character.find(params[:id])
    render json: FighterSerializer.new(character.fighters.alphabetical_name), status: 200
  end

  def create
    character = Character.new(character_params)
    if character.save
      render json: CharacterSerializer.new(character), status: 201
    else
      render status: 400
    end
  end

  def update
    character = Character.find(params[:id])
    if character.update(character_params)
      render json: CharacterSerializer.new(character)
    else
      render status: 422
    end
  end

  private

  def character_params
    params.require(:character).permit(:origin)
  end
end
