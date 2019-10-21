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

def row_builder
  
end

def table_data(table)
  data = table.css("tr")
  data.shift
  daters = data.map{|row|row.css("td").map{|cell|cell.text.split(", ")}}
  
  daters.each { |row|
    columns = row.max{ |a,b| a.length <=> b.length }.length
    row.each { |cell| cell << " " until cell.length == columns }
  }
  
  row_break = "-------------------------"
  cell_break = " | "
  
  puts row_break
  
  daters.each { |row|
    #filled_row = "| "
    row[1].each_with_index { |feature, index| 
      filled_row = "| "
      filled_row << row[0][index]
      filled_row << cell_break
      filled_row << feature
      puts filled_row
      #filled_row << cell_break
      #puts filled_row
    }
    #puts filled_row
    puts row_break
  }
  
  # daters.each { |row|
    
  #   full_row = "| "
  #   full_row << row[0][0]
  #   full_row << cell_break
  #   full_row << row[1][0]
  #   puts full_row
    
  #   full_row = "| "
  #   full_row << row[0][1]
  #   full_row << cell_break
  #   full_row << row[1][1]   
  #   puts full_row
    
  #   puts row_break
  # }
  
  #binding.pry
  #puts daters
end

#table_header(html)

table_data(html)

#binding.pry

def table_parser(table)   #=> input post-nokogiri <table> selector
  
  
  
end