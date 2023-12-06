class CreateGame < ActiveRecord::Migration[7.0]
  def change
    create_table :game do |t|
      t.boolean :started, null:false
      t.boolean :finished, null:false
    end
  end
end