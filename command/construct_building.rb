# frozen_string_literal: true

require_relative './base'
require_relative '../lib/calculate_resources'

module Command
  class ConstructBuilding < Command::Base
    def name
      :construct_building
    end

    def description
      "Construct a building"
    end

    def execute(request:)
      requested_building = request.event.options['building']

      building_cost = building_costs[requested_building]
      player = Player.where(discord_id: request.event.user.id).first
      player_resources = Lib::CalculateResources.new(Config::ResourceGeneration.new).call(player)

      if player_resources['Wood'] > building_cost['Wood'] &&
        player_resources['Stone'] > building_cost['Stone'] &&
        player_resources['Food'] > building_cost['Food']
        request.event.respond(content: 'Building!')
      else
        request.event.respond(content: 'Not Building!')
      end
    end

    def options
      [
        Options.new(
          type: 'string',
          name: 'building',
          description: 'Pick a building to construct',
          required: true,
          choices: {
            Barracks: 'Barracks',
            Wall: 'Wall'
          }
        )
      ]
    end

    private

    def building_costs
      @building_costs ||= YAML.load_file(File.expand_path('..', __dir__) + '/config/building_costs.yml')['buildings']
    end
  end
end