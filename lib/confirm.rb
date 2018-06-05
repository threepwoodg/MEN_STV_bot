def confirm?
  puts "Для подтверждения ввести 'yes' или 'no' для отмены"
  loop do
    result = gets.chomp
    if result == "yes"
      return true
    elsif result == "no"
      return false
    else
      puts "Только 'yes' или 'no'"
    end
  end
end