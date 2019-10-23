require 'pry'
require 'open-uri'
require 'nokogiri'

class AnceClass
  
end

def anceclass
  
html = Nokogiri::HTML(open('https://2e.aonprd.com/Ancestries.aspx'))

ancebreak = {}

html.css("h2 a").each{ |role|
  if role.attribute("href").value.include?("Ancestries.aspx?ID")
    ancebreak[role.text] = role.attribute("href").value
  end
}

ancebreak

end
#$ancestry = ancebreak[gets.chomp.capitalize]

#hell = gets.chomp

#$heaven = Nokogiri::HTML(open("https://2e.aonprd.com/"+ancebreak[hell])).css("i")[1].text # => grabs flavor blurb