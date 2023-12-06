# frozen_string_literal: true

require 'discordrb'
require 'pry'
require_relative './initialise'
require_relative './command/helpers/list'
require_relative './command/helpers/register_command'
require_relative './models/ayers'
require_relative './command/request'

bot = Discordrb::Bot.new(token: ENV.fetch('SLASH_COMMAND_BOT_TOKEN', nil), intents: [:server_messages])
Command::Helpers::RegisterCommands.run(bot: bot)

Command::Helpers::LIST.each do |command|
  bot.application_command(command.name) do |event|
    puts "#{event.user.username} executed command: #{command.name}"
    game = Games.first
    request = Request.new(game:game,event:event)
      command.execute(request:request)
  end
end

bot.run
