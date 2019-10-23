require_relative "ABCs.rb"
require_relative "Adventurer.rb"

def startup
  
  puts "A character begins with a concept."
  puts "What is your pitch, in twelve words or fewer?"
  
end

def sel_concept
  
  pitch = gets.chomp
  
  Adventurer.new(pitch)
  
end

def sel_screen(character)
  
  puts " _______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" 
  puts "| #{character.name}"
  puts "|_______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" if character.ancestry
  puts "| Ancestry:   #{character.ancestry}" if character.ancestry
  puts "| Background: #{character.background}" if character.background
  puts "| Class:      #{character.class}" if character.class
  puts "|" if character.class
  puts "'"
  puts "'"
  puts "'"

end

def sel_aspect(aspect, character)
  
  puts "Select a #{aspect.to_s.capitalize}"
  
  
  
  choice = gets.chomp.capitalize
  
  puts "Will you play a #{choice}? Y/N"
  
  confirm = gets.chomp.capitalize[0]
  
  if confirm == "Y"
    character.send("#{aspect}=", choice)
  else
    sel_aspect(aspect, character)
  end
  
end

def prompter
  startup
  character = sel_concept
  sel_screen(character)
  sel_aspect(:ancestry, character)
  sel_aspect(:background, character)
  sel_aspect(:class, character)
  sel_screen(character)
end

prompter

class Writer
  
end