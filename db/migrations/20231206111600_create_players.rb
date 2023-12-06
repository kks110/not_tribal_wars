class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.bigint :discord_id, null: false
      t.text :username, null: false
    end
  end
end