module Command
  class Request
    def initialize(event:, game:)
      @event = event
      @game = game
    end

    attr_reader :event, :game
  end
end