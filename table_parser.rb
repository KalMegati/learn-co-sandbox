require 'pry'
require 'open-uri'
require 'nokogiri'

html = Nokogiri::HTML(open('https://2e.aonprd.com/Classes.aspx?ID=8'))

def table_header(table)
  head = table.css("tr").first
  headers = []
  if head.css("th").length > 0
    head.css("th").each { |cell|
      headers << cell.text.upcase
    }
  elsif head.css("td").length > 0
    head.css("td").each { |cell|
      headers << cell.text.upcase
    }
  end
  headers
end

def table_data(table)
  data = table.css("tr")
  data.shift
  daters = data.map{|row|row.css("td").map{|cell|cell.text.downcase.split(", ")}}
end

def table_parser(headers, daters)
  head = "| "
  headers.each { |categ|
    head << categ
    head << " | "
  }
  
  puts head
  
  daters.each { |row| # => extending for column size equivalence
    columns = row.max{ |a,b| a.length <=> b.length }.length
    row.each { |cell| cell << " " until cell.length == columns }
  }
  
  daters.each { |row| # => extending for row size equivalence
    row.each { |cell| 
      row_width = cell.max{ |a,b| a.length <=> b.length }.length
      cell.each { |feature| feature << " " until feature.length == row_width }
    }
  }
  
  row_break = "-------------------------"
  cell_break = " | "
  
  puts row_break
  
  daters.each { |row|
    #filled_row = "| "
    row[0].each_with_index { |feature, index| 
      filled_row = "| "
      row.length.times { |time|
        filled_row << row[time][index]
        filled_row << cell_break
      }
      puts filled_row
      #filled_row << cell_break
      #puts filled_row
    }
    #puts filled_row
    puts row_break
  }
  
  #binding.pry
  #puts daters
end

headers = table_header(html)

daters = table_data(html)

table_parser(headers, daters)