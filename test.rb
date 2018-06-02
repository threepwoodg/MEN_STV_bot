require 'spreadsheet'
require 'google_drive'

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet.open("lib/new_Template_SZ_MEN.xls")
sheet = book.worksheet(0)
sheet[5,1] = 'name'
sheet[5,2] = 'id'
sheet[5,3] = 'po'
sheet[5,4] = '1c'
sheet[5,5] = 'uzel1_name'
sheet[5,6] = 'uzel1_port'
sheet[5,7] = 'uzel1_tag' # if need
sheet[5,8] = 'uzel2_name'
sheet[5,9] = 'uzel2_port'
sheet[5,10] = 'uzel2_tag' # if need
sheet[5,11] = 'speed'
sheet[5,12] = 'comments' # if need
sheet[5,13] = 'vsi_name'
sheet[5,14] = 'description'
book.write("lib/new1.xls")

#--------

session = GoogleDrive::Session.from_config("key.json")
ws = session.spreadsheet_by_key("").worksheets[0]
i = 1
while ws[i,2] != ""
  @row = i
  i+=1
end

ws[@row,2] = "id12333211"
ws[@row,3] = "PO12341242"
ws[@row,4] = "1c23141412"
ws[@row,5] = "nameetsttestetstetetsttetstttestst"
ws[@row,6] = "vplan"
ws[@row,8] = "none"
ws[@row,9] = "none"
#ws.save

#--------