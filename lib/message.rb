def message_request(bot,message)
  if message.text == "/get_vsi"
    bot.api.send_message(chat_id: message.chat.id, text: "тест ок")
  end
end