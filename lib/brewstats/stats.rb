class BrewStats::Stats
  
  attr_accessor :name, :number_breweries, :rank
  
   # should return a bunch of instances of Stats for all states
  def self.all_states
    puts <<-DOC
      1. Alabama: 41 Craft Breweries...
      2. Alaska: 42 Craft Breweries...
    DOC
    states_1 = self.new
    states_1.name = "Alabama"
    states_1.number_breweries = "42"
    states_1.rank = "23rd"
    
    [states_1]
  end
  
end