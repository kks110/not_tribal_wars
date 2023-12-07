# frozen_string_literal: true

require_relative './base'

module Command
  class ViewVillage < Command::Base
    def name
      :view_village
    end

    def description
      "View details about your village"
    end

    def execute(request:)
      village_id = request.event.options['village_id']
      village = Village.where(id: village_id).first

      buildings = village.buildings

      response = "Village name: #{village.id} \nBuildings: #{buildings.map { |building| "#{building.building_type.name} (Level: #{building.level})" }.join(', ')}"

      request.event.respond(content: response, ephemeral: true)
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end

    def options
      [
        Options.new(
          type: 'integer',
          name: 'village_id',
          description: 'The ID of the village you wish to view',
          required: true
        )
      ]
    end
  end
end
