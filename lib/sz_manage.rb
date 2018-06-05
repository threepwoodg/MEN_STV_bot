require 'spreadsheet'

def sz_new(region, options = {})
  Spreadsheet.client_encoding = 'UTF-8'

  book = Spreadsheet.open("lib/template/Template_SZ_MEN.xls")
  sheet = book.worksheet(region)
  print "\nНаименование клиента : "
  sheet[5,1] = options[:new_row][3] || gets.chomp
  print "\nid канала: : "
  sheet[5,2] = options[:new_row][0] || gets.chomp
  print "\nНомер проекта (po): "
  sheet[5,3] = options[:new_row][1] || gets.chomp
  print "\nНомер заявки (1c):  "
  sheet[5,4] = options[:new_row][2] || gets.chomp
  print "\nТочка 1 NE end point (например: acc15-1-Lenina244.STV): "
  sheet[5,5] = gets.chomp
  print "\nТочка 1 NE end point PORT (например: GE0/0/1): "
  sheet[5,6] = gets.chomp
  print "\nТочка 1 NE end point dot1q tag '!если нужно!' (например: 2001): "
  sheet[5,7] = gets.chomp
  print "\nТочка 2 NE core (например: agg1.Lenina244.STV): "
  sheet[5,8] = gets.chomp
  print "\nТочка 2 NE core порт (например: Eth-Trunk5): "
  sheet[5,9] = gets.chomp
  print "\nТочка 2 NE core dot1q tag (например: 2001): "
  sheet[5,10] = gets.chomp
  print "\nШейпинг (кроме BS data сервисов) (например: 1024): "
  sheet[5,11] = options[:new_row][7] || gets.chomp
  print "\nКомментарий (например: !!!РАЗБОР КАНАЛА!!!): "
  sheet[5,12] = gets.chomp
  sheet[5,13] = "id#{options[:new_row][0]}" || "id#{sheet[5,2]}"
  print "\nСкала клиента (scala) (например: SC321): "
  scala = options[:new_row][7] || gets.chomp
  print "\nТип сервиса (vplan,ipvpn,int): "
  type = options[:new_row][4] || gets.chomp
  sheet[5,14] = "---### #{type} #{sheet[5,1]} Sc.#{scala} PO-#{sheet[5,3]} 1c-#{sheet[5,4]} id-#{sheet[5,2]} ###---"
  print "\nvsi-id: "
  sheet[5,15] = options[:new_row][8] || gets.chomp
  book.write("SZ/#{sheet[5,1]} Sc.#{scala} PO-#{sheet[5,3]} 1c-#{sheet[5,4]} id-#{sheet[5,2]}.xls")
  puts "\nФайл с именем #{sheet[5,1]} Sc.#{scala} PO-#{sheet[5,3]} 1c-#{sheet[5,4]} id-#{sheet[5,2]}.xls сохранен на диск в папке SZ"
  return sheet
end