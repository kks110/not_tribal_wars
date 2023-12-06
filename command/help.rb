require_relative './base'
require_relative './helpers/list'

module Command
  class Help < Command::Base
    def name
      :help
    end

    def description
      "Show a list of command"
    end

    def execute(event:)
      event.respond(content: 'Tets')

    rescue => e
      ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end
