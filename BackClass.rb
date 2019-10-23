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

<<<<<<< HEAD
backbreak

end

#$background = backbreak[gets.chomp.capitalize]
=======
$background = backbreak[gets.chomp.capitalize]
>>>>>>> a8aab6083659346a764919ba0a68c6e650da51b2
