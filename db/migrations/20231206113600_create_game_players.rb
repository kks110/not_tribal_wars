class CreateGamePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :game_players do |t|
      t.integer :player_id, null:false
      t.integer :game_id, null:false
    end
  end
end