class PlayersController < ApplicationController
  def index
    players = Player.all
    render json: players
  end

  def create
    player = Player.new(player_params)
    if player.save
      render json: player, status: :created
    else
      render json: { errors: player.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    render json: { message: "Player deleted successfully" }
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
