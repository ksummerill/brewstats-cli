# Class to handle creating objects from scaper and adding attributes

class BrewStats::States

  attr_accessor :name, :number_breweries, :rank, :per_capita, :eco_impact, :barrels

  @@all = []
  @@state_stats = []

  def initialize(name, number_breweries, rank, per_capita, eco_impact, barrels)
    @name = name
    @number_breweries = number_breweries
    @rank = rank
    @per_capita = per_capita
    @eco_impact = eco_impact
    @barrels = barrels
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def stats_for_each_state
    @@all.each do |state|
      @@state_stats << state.name
      @@state_stats << state.number_breweries
      @@state_stats << state.rank
      @@state_stats << state.per_capita
      @@state_stats << state.eco_impact
      @@state_stats << state.barrels
    end
    @@state_stats
  end

end
