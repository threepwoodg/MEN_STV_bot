require 'spreadsheet'
require 'google_drive'
require_relative 'lib/db_manage'
require_relative 'lib/confirm'
require_relative 'lib/sz_manage'

#--------

loop do
  puts "Выбор региона:
    0. Ставрополь MEN
    1. Пятигорск MEN
    2. Черкесск MEN"
  region = gets.chomp.to_i
  puts "    1. Создать новую запись в базе/выделить vsi
    2. Изменить существующую запись в базе
    3. Создать СЗ
    4. отмена"
  result = gets.chomp
  if result == "1"
    row = db_new_row(region)
    db_save_row(row[0],row[1])
    puts "Сделать СЗ на основе введеных данных?"
    sz_new(region, new_row: row[1]) if confirm?
  elsif result == "2"
    print "Номер vsi/vlan: "
    vsi = gets.chomp
    edit_row = db_new_row(region)
    db_edit_row(region,vsi,edit_row[1])
  elsif result == "3"
    sz_new(region, new_row: [])
  elsif result == "4"
    break
  end
  break if result == "exit"
end