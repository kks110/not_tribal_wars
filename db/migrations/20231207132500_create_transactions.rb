require_relative '../../models/transaction'
require_relative '../../models/resource_type'

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :resource_types do |t|
      t.string :name
    end

    create_table :transactions do |t|
      t.belongs_to :game_player
      t.belongs_to :resource_type
      t.integer :resource_change
      t.integer :current_resource_total
      t.timestamps
    end


    ResourceType.create(name: 'Wood')
    ResourceType.create(name: 'Food')
    ResourceType.create(name: 'Stone')


  end

end