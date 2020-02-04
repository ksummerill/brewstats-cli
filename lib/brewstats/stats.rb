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

    # return my stats array
    # puts stats
  end

  # all properties for scraping here
  # go to ba.com, find stats for states
  # extract the name, # breweries, rank, $impact, barrels/year, per cap
  # instantiate a state
  def self.scrape_ba
    site_1 = "https://www.brewersassociation.org/statistics-and-data/state-craft-beer-stats/"
    doc = Nokogiri::HTML(open(site_1))

    # https://stackoverflow.com/questions/38013461/properly-separate-string-elements-in-an-array
    state = self.new
    state.name = doc.css("#state-header").css("h1").map(&:text)
    state.number_breweries = doc.css("#per-state").css(".total").css("span.count").map(&:text)
    state.rank = doc.css("#per-state").css(".total").css("span.rank").map(&:text)
    state.per_capita = doc.css("#per-state").css("span.per-capita").css("span.count").map(&:text)
    state.eco_impact = doc.css("#economic-impact").css("span.total").css("span.count").map(&:text)
    state.barrels = doc.css("#production").css("span.total").css("span.count").map(&:text)

    # keep this 'state' here - returns one massive object with all properties in the order listed above
    # state
    # returns an array of state names
    state.name

      # From output of `state` on line 41, how do I connect the name of "Alabama"
      # to the `number_breweries` of `41` and so on through the whole output?
      # all_states_array = []
      # state.name.each do |name|
      #   # creates a new object for each state name
      #   name = self.new
      #   all_states_array << name
      # end

      # puts all_states_array

  end


end


# state.name.each do |name|
#   # creates a new object for each state name
#   name = self.new
#   puts "Hello #{name}"
# end
#
# state.number_breweries.each do |num|
#   # creates a new object for each number_breweries
#   num = self.new
#   puts "#{num} is a lot of breweries!"
# end
