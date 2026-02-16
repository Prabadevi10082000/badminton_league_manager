class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :matches_as_player_a, class_name: "Match", foreign_key: :player_a_id
  has_many :matches_as_player_b, class_name: "Match", foreign_key: :player_b_id

  def win_percentage
    total = wins + losses
    return 0 if total.zero?
    ((wins.to_f / total) * 100).round(2)
  end
end
