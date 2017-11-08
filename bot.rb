require 'telegram/bot'

token = ENV['BSBOT_TOKEN']
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [['Yes, please!', 'No, thanks.']], one_time_keyboard: true)
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hi, #{message.from.first_name}, do u wanna get info about your favorite musicians?", reply_markup: answers)
    end
  end	
end
