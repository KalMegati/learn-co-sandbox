require 'pry'
require 'open-uri'
require 'nokogiri'

class ABCs
  
  attr_reader :ancestries, :backgrounds, :classes
  
  @@source = "https://2e.aonprd.com/"
  
  def archivist(aspect)
    Nokogiri::HTML(open(@@source+aspect+'.aspx'))
  end
  
  def hasher(aspect, header)
    dictionary = {}
    archivist(aspect).css("#{header} a").each{ |role|
      if role.attribute("href").value.include?("#{aspect}.aspx?ID")
        dictionary[role.text] = role.attribute("href").value
      end
    }
    dictionary
  end
  
  def initialize
    @ancestries = hasher("Ancestries", "h2")
    @backgrounds = hasher("Backgrounds", "h1")
    @classes = hasher("Classes", "h1")
  end
  
  def summarize(option, aspect) # => grabs flavor blurb
    binding.pry
    page = "https://2e.aonprd.com/"+self.send("#{aspect.downcase}")[option]
    if page.include?("Backgrounds")
      binding.pry
      puts "Wild"
    else
      puts Nokogiri::HTML(open(page)).css("i")[1].text
    end
  end
  
end

why = ABCs.new

why.summarize("Acolyte", "BACKGROUNDS")

#binding.pry