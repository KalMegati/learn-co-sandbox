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

<<<<<<< HEAD
classbreak

end

#$class = classbreak[gets.chomp.capitalize]
=======
$class = classbreak[gets.chomp.capitalize]
>>>>>>> a8aab6083659346a764919ba0a68c6e650da51b2
