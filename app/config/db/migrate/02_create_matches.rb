class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :player_a_id
      t.integer :player_b_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
