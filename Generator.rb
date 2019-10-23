require 'pry'
require 'open-uri'
require 'nokogiri'

source = "http://2e.aonprd.com/"

html = Nokogiri::HTML(open(source+'Ancestries.aspx'))

races = html.css("h1").css("a").select{|info|!info.text.include?(" ")}

info = html.css("div#main").css("span")[-1]

info.css("h2").remove

desc = info.text.split("Click here for more details.")

racebreak = {}

races.map{|race|race.text}.each_with_index{ |race, index|
  racebreak[race] = desc[index]
}



# race = Nokogiri::HTML(open(source + info[0]["href"]))

# race_heads = race.css("div.main").css("h2").map{|heading|heading.text}

# flastar = race_heads.index("You Might...")

# mechstar = race_heads.index("Hit Points")

# flavor = race_heads[flastar...mechstar]

# mechanics = race_heads[mechstar...]

binding.pry

