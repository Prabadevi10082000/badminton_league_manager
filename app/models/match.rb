class Match < ApplicationRecord
  belongs_to :player_a, class_name: "Player"
  belongs_to :player_b, class_name: "Player"
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validate :players_must_be_different
  validate :winner_must_be_participant

  after_create :update_player_stats

  private

  def players_must_be_different
    errors.add(:base, "Players must be different") if player_a_id == player_b_id
  end

  def winner_must_be_participant
    unless [player_a_id, player_b_id].include?(winner_id)
      errors.add(:base, "Winner must be one of the players")
    end
  end

  def update_player_stats
    winner.increment!(:wins)
    loser.increment!(:losses)
  end
end
