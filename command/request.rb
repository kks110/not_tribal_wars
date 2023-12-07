module Command
  class Request
    def initialize(event:, game:, resource_generation:)
      @event = event
      @game = game
      @resource_generation = resource_generation
    end

    attr_reader :event, :game, :resource_generation
  end
end