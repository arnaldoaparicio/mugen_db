class Api::V1::FightersController < ApplicationController
  def create
    fighter = Fighter.new(fighter_params)
    if fighter.save
      render json: FighterSerializer.new(fighter), status: 201
    else
      render status: 400
    end
  end

  def update
    fighter = Fighter.find(params[:fighter_id])
    if fighter.update(fighter_params)
      render json: FighterSerializer.new(fighter)
    else
      render status: 422
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :character_id)
  end
end
