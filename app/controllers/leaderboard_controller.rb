class LeaderboardController < ApplicationController
  def index
    players = Player.order(wins: :desc, losses: :asc)
    render json: players
  end
end
