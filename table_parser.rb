require 'pry'
require 'open-uri'
require 'nokogiri'

html = Nokogiri::HTML(open('https://2e.aonprd.com/Classes.aspx?ID=8'))

def table_header(table)
  head = table.css("tr").first
  headers = []
  if head.css("th").length > 0
    head.css("th").each { |cell|
      headers << cell.text
    }
  elsif head.css("td").length > 0
    head.css("td").each { |cell|
      headers << cell.text
    }
  end
  puts headers
end

def table_data(table)
  data = table.css("tr")
  daters = data.map{|row|row.css("td").text}
  #binding.pry
  puts daters
end

table_header(html)

#table_data(html)

#binding.pry

def table_parser(table)   #=> input post-nokogiri <table> selector
  
  
  
end