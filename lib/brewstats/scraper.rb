# Class that handles scrapping of website, saving state objects

class BrewStats::Scraper

   # should return a bunch of instances of Stats for all states
   # by scrapping brewersassociation.com
  def self.all_states
    self.scrape_stats
  end


  def self.scrape_stats
    all_state_objects = []

    all_state_objects << self.scrape_ba

    # return my stats array
    # puts stats
  end

  # all properties for scraping here
  # go to ba.com, find stats for states
  # extract the name, # breweries, rank, $impact, barrels/year, per cap
  # instantiate a state
  def self.scrape_ba
    site_1 = "https://www.brewersassociation.org/statistics-and-data/state-craft-beer-stats/"
    doc = Nokogiri::XML(open(site_1))

    state_objects = []
    # state_names = []

    # https://stackoverflow.com/questions/38013461/properly-separate-string-elements-in-an-array
    states = doc.css(".stat-container")

    states.each do |state|
      name = doc.css("#state-header").css("h1").map(&:text)
      number_breweries = doc.css("#per-state").css(".total").css("span.count").map(&:text)
      rank = doc.css("#per-state").css(".total").css("span.rank").map(&:text)
      per_capita = doc.css("#per-state").css("span.per-capita").css("span.count").map(&:text)
      eco_impact = doc.css("#economic-impact").css("span.total").css("span.count").map(&:text)
      barrels = doc.css("#production").css("span.total").css("span.count").map(&:text)

      state_objects << self

      BrewStats::States.new(name, number_breweries, rank, per_capita, eco_impact, barrels)

    end
    state_objects
  end


end
