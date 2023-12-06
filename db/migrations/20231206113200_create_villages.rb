class CreateVillages < ActiveRecord::Migration[7.0]
  def change
    create_table :villages do |t|
      t.integer :player_id, null: false
      t.integer :vegetable_patch_level, default: 1, null: false
      t.integer :mine_level, default: 0, null: false
      t.integer :forest_level, default: 1, null: false
      t.integer :barracks_level, default: 0, null: false
      t.integer :wall_level, default: 0, null: false
    end
  end
end