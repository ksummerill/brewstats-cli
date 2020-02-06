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

  # method that will
  # def make_states
  #
  # end

  def self.all
    BrewStats::Scraper.scrape_ba if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end



end
