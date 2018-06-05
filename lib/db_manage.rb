require 'google_drive'

def db_connect(region)
  session = GoogleDrive::Session.from_config("key.json")
  return session.spreadsheet_by_key("").worksheets[region]
end

def db_new_row(region)
  new_row = []
  print "id канала: "
  new_row[0] = gets.chomp
  print "Номер проекта (po): "
  new_row[1] = gets.chomp
  print "Номер заявки (1c): "
  new_row[2] = gets.chomp
  print "Наименование клиента: "
  new_row[3] = gets.chomp
  print "Тип сервиса (vplan,ipvpn,int): "
  new_row[4] = gets.chomp
  time = Time.new
  new_row[5] = time.strftime("create:%d.%m.%Y-%H:%M")
  print "Комментарий (если нужно): "
  new_row[6] = gets.chomp
  print "Скорость: "
  new_row[7] = gets.chomp
  print "Точка терминации (PE/cisco2/an-01): "
  new_row[8] = gets.chomp
  print "Скала клиента (scala): "
  new_row[9] = gets.chomp
  db = db_connect(region)
  new_row[10] = db_empty_vsi(db)
  puts "---### Записи присвоен vsi-id: #{new_row[10]} ###---"
  puts "---### Записать изменения в базу? ###---"
  return db, new_row
end

def db_edit_row(region,vsi,new_row)
  db = db_connect(region)
  i = 1
  while db[i,1] != vsi
    @row = i + 1
    i+=1
  end
  db[@row,2] = "id#{new_row[0]}" # id
  db[@row,3] = new_row[1] # po
  db[@row,4] = new_row[2] # 1c
  db[@row,5] = new_row[3] # name
  db[@row,6] = new_row[4] # mode
  db[@row,8] = new_row[5] # time
  db[@row,9] = new_row[6] # comment
  db[@row,10] = new_row[7] # speed
  db[@row,11] = new_row[8] # point
  confirm? ? db.save : return
  puts "Ура! Сохранение прошло успешно :)"
end

def db_save_row(db,new_row)
  row = db_empty_row(db)
  db[row,2] = "id#{new_row[0]}" # id
  db[row,3] = new_row[1] # po
  db[row,4] = new_row[2] # 1c
  db[row,5] = new_row[3] # name
  db[row,6] = new_row[4] # mode
  db[row,8] = new_row[5] # time
  db[row,9] = new_row[6] # comment
  db[row,10] = new_row[7] # speed
  db[row,11] = new_row[8] # point
  confirm? ? db.save : return
  puts "Ура! Сохранение прошло успешно :)"
end

def db_empty_vsi(db)
  i = 1
  while db[i,2] != ""
    @row = i + 1
    i+=1
  end
  return db[@row,1]
end

def db_empty_row(db)
  i = 1
  while db[i,2] != ""
    @row = i + 1
    i+=1
  end
  return @row
end