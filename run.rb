# frozen_string_literal: true

require 'discordrb'
require 'pry'
require_relative './initialise'
require_relative './command/helpers/list'
require_relative './command/helpers/register_commands'
require_relative './models/player'
require_relative './models/game'
require_relative './models/game_player'
require_relative './models/building'
require_relative './models/building_type'
require_relative './models/village'
require_relative './command/request'
require_relative './command/list_your_villages'
require_relative './models/resource_type'
require_relative './models/transaction'
require_relative './config/resource_generation'


bot = Discordrb::Bot.new(token: ENV.fetch('SLASH_COMMAND_BOT_TOKEN', nil), intents: [:server_messages])
Command::Helpers::RegisterCommands.run(bot: bot)

resource_generation = Config::ResourceGeneration.new
Command::Helpers::LIST.each do |command|
  bot.application_command(command.name) do |event|
    puts "#{event.user.username} executed command: #{command.name}"
    game = Game.first

    request = Command::Request.new(game: game, event: event, resource_generation: resource_generation)
    command.execute(request:request)
  end
end

bot.run
