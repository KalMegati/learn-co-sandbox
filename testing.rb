require 'pry'

require 'open-uri'

require 'nokogiri'

html = Nokogiri::HTML(open('https://2e.aonprd.com/Classes.aspx?ID=8'))

table = html.css("table.inner").text.scan(/(\d+[A-Z]\D+\d*\s\D+)/)

hashtable = {}

table.each_with_index{ |level, index| 
  level[0][0] = "" until level[0][0].match(/\D/)
  hashtable[index+1] = level[0].split(", ")
}

binding.pry

puts hashtable