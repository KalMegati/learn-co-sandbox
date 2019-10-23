require 'pry'
require 'open-uri'
require 'nokogiri'

def charclass

html = Nokogiri::HTML(open('https://2e.aonprd.com/Classes.aspx'))

classbreak = {}

html.css("h1 a").each{ |role|
  if role.attribute("href").value.include?("Classes.aspx?ID")
    classbreak[role.text] = role.attribute("href").value
  end
}

classbreak

end

#$class = classbreak[gets.chomp.capitalize]