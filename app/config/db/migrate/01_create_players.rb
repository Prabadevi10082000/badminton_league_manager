class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :wins, default: 0
      t.integer :losses, default: 0

      t.timestamps
    end

    add_index :players, :name, unique: true
  end
end
