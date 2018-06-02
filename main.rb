require 'telegram/bot'
require 'spreadsheet'
require 'google_drive'
require_relative 'lib/message'

token = ''
Telegram::Bot::Client.run(token, logger: Logger.new("lib/log.txt")) do |bot|
  bot.logger.info('Bot has been started')
  bot.listen do |message|
    case message
    when Telegram::Bot::Types::InlineQuery
      p "Empty"
    when Telegram::Bot::Types::CallbackQuery
      p "callback ok"
    when Telegram::Bot::Types::Message
      message_request(bot,messgae)
    end
  end
end