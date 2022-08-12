class Api::V1::FightersController < ApplicationController
  def create
    fighter = Fighter.new(fighter_params)
    if fighter.save
      render json: FighterSerializer.new(fighter), status: 201
    else
      render status: 400
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :character_id)
  end
end
