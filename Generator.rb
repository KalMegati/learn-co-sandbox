require 'pry'
require 'open-uri'
require 'nokogiri'

html = Nokogiri::HTML(open('http://2e.aonprd.com/Ancestries.aspx'))

info = html.css("h1").css("a").select{|info|!info.text.include?(" ")}

binding.pry