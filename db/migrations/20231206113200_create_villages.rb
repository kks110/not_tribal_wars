class CreateVillages < ActiveRecord::Migration[7.0]
  def change
    create_table :villages do |t|
      t.belongs_to :player
      t.belongs_to :game
    end
  end
end