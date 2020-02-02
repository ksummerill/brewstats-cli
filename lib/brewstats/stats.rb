# Class that handles scrapping of website, saving state objects

class BrewStats::Stats

  attr_accessor :name, :number_breweries, :rank, :per_capita, :eco_impact, :barrels

   # should return a bunch of instances of Stats for all states
   # by scrapping brewersassociation.com
  def self.all_states
    self.scrape_stats
  end


  def self.scrape_stats
    stats = []

    stats << self.scrape_ba

    # go to ba.com, find stats for states
    # extract the name, # breweries, rank, $impact, barrels/year, per cap
    # instantiate a state

    # return my stats array
    stats
  end

  # all properties for scraping here
  def self.scrape_ba
    site_1 = "https://www.brewersassociation.org/statistics-and-data/state-craft-beer-stats/"
    doc = Nokogiri::HTML(open(site_1))

    stat = self.new
    stat.name = doc.css("#state-header").css("h1").text
    stat.number_breweries = doc.css("#per-state").css(".total").css("span.count").text
    stat.rank = doc.css("#per-state").css(".total").css("span.rank").text
    stat.per_capita = doc.css("#per-state").css("span.per-capita").css("span.count").text
    stat.eco_impact = doc.css("#economic-impact").css("span.total").css("span.count").text
    stat.barrels = doc.css("#production").css("span.total").css("span.count").text

      # From scrape lecture - not sure yet where I want this to go

      stat.name.each do |state|
        puts state.css("#state-header")[0].css("h1").text
      end

    stat

  end


end


# saving hardcoded method for practice
# def self.scrape_stats
#   # states_1 and states_2 are hardcoded but are returning objects
#   states_1 = self.new
#   states_1.name = "Alabama"
#   states_1.number_breweries = "42"
#   states_1.rank = "23rd"
#
#   states_2 = self.new
#   states_2.name = "Alaska"
#   states_2.number_breweries = "12"
#   states_2.rank = "43rd"
#
#
#   [states_1, states_2]
# end
