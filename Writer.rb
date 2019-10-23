require_relative "AnceClass.rb"
require_relative "BackClass.rb"
require_relative "CharClass.rb"

def startup
  
  puts "A character begins with a concept."
  puts "What is your pitch, in twelve words or fewer?"
  
end

def sel_concept
  
  $concept = gets.chomp
  
end

def sel_screen
  
  puts " _______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" 
  puts "| #{$concept}"
  puts "|_______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|"
  puts "| Ancestry:   #{$ancestry}" if $ancestry
  puts "| Background: #{$background}" if $background
  puts "| Class:      #{$class}" if $class
  
end

def sel_aspect()
  
  puts "Select an Ancestry"
  
  puts anceclass
  
  choice = gets.chomp.capitalize
  
  puts "Will you play a #{choice}? Y/N"
  
  confirm = gets.chomp.capitalize[0]
  
  if confirm == "Y"
    $ancestry = choice
  else
    sel_aspect
  end
  
end

startup
sel_concept
sel_screen
sel_aspect
sel_screen
#binding.pry

class Writer
  
end