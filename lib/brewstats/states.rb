# Class to handle creating objects from scaper and adding attributes

class BrewStats::States

  attr_accessor :name, :number_breweries, :rank, :per_capita, :eco_impact, :barrels

  @@all = []

  def initialize(name, number_breweries, rank, per_capita, eco_impact, barrels)
    @name = name
    @number_breweries = number_breweries
    @rank = rank
    @per_capita = per_capita
    @eco_impact = eco_impact
    @barrels = barrels
    save
  end

  # method I can call to collect all state objects in an array
  def self.all
    @@all
  end

  # save each instantiation of a state object into @@all
  def save
    @@all << self
  end


end
