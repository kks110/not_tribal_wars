# frozen_string_literal: true

require 'discordrb'
require 'pry'
require_relative './initialise'
require_relative './commands/helpers/list'
require_relative './commands/helpers/register_commands'

bot = Discordrb::Bot.new(token: ENV.fetch('SLASH_COMMAND_BOT_TOKEN', nil), intents: [:server_messages])
Command::Helpers::RegisterCommands.run(bot: bot)

Command::Helpers::LIST.each do |command|
  bot.application_command(command.name) do |event|
    puts "#{event.user.username} executed command: #{command.name}"

      command.execute(event: event)
  end
end

bot.run
