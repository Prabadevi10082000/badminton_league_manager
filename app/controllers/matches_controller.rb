class MatchesController < ApplicationController
  def create
    match = Match.new(match_params)

    match.loser_id =
      match.player_a_id == match.winner_id ? match.player_b_id : match.player_a_id

    if match.save
      render json: match, status: :created
    else
      render json: { errors: match.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:player_a_id, :player_b_id, :winner_id)
  end
end
