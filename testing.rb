require 'pry'

require 'open-uri'

require 'nokogiri'

html = Nokogiri::HTML(open('https://2e.aonprd.com/Classes.aspx?ID=8'))

table_raw = html.css("table.inner")

#fixed_table = html.css("table.inner").css("td").map{|cell|cell.text}

table = table_raw.text.scan(/(\d+[A-Z]\D+\d*\s\D+)/)

#mapping = table_raw.map{|elem|elem}.each{|line| puts "1"}

hashtable = {}

# table.each_with_index{ |level, index| 
#   level[0][0] = "" until level[0][0].match(/\D/)
#   hashtable[index+1] = level[0].split(", ")
# }

binding.pry

# puts "Which level?"

# puts hashtable[gets.to_i]