require_relative "AnceClass.rb"
require_relative "BackClass.rb"
require_relative "CharClass.rb"

def sel_screen
  
  puts " _______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" 
  puts "| Pathfinder 2E Character Builder"
  puts "|_______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|"
  puts "| Ancestry:   #{$ancestry}"
  puts "| Background: #{$background}"
  puts "| Class:      #{$class}"
  
end

sel_screen

#binding.pry

class Writer
  
end