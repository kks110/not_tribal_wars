module Lib
  class CalculateResources
    def initialize(resource_generation)
      @resource_generation = resource_generation
    end

    def call(player)
      transactions = get_transactions(player)
      resources = {}

      transactions.each do |transaction|
        resource_counter = 0

        player.villages.each do |village|
          resource_counter += case transaction.resource_type.name
                              when 'Wood'
                                village.wood_generated_per_minute(@resource_generation)
                              when 'Stone'
                                village.stone_generated_per_minute(@resource_generation)
                              when 'Food'
                                village.food_generated_per_minute(@resource_generation)
                              end

          difference = (Time.now - transaction.updated_at).floor
          calculated_change = (difference / 60) * resource_counter
          total_resource = calculated_change + transaction.current_resource_total

          resources[transaction.resource_type.name] = total_resource
        end
      end

      resources
    end

    private

    def get_transactions(player)
      ResourceType.all.each_with_object([]) do |resource_type,array|
        array << Transaction.where(game_player_id: player.game_players.first.id, resource_type_id: resource_type.id).order(updated_at: :desc).first
      end
    end
  end
end