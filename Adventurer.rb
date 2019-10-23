class Adventurer
  
  attr_accessor :high_concept, :ancestry, :background, :class, :description
  
  @@all = []
  
  def initialize(high_concept)
    @high_concept = high_concept
  end
  
  def lookup(aspect)
    @@all.select()
  end
  
end