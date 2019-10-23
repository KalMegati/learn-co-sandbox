require 'pry'
require 'open-uri'
require 'nokogiri'

def backclass

html = Nokogiri::HTML(open('https://2e.aonprd.com/Backgrounds.aspx'))

backbreak = {}

html.css("h1 a").each{ |role|
  if role.attribute("href").value.include?("Backgrounds.aspx?ID")
    backbreak[role.text] = role.attribute("href").value
  end
}

backbreak

end

#$background = backbreak[gets.chomp.capitalize]