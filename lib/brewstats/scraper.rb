# Class that handles scrapping of website, saving state objects

class BrewStats::Scraper

  # all properties for scraping here. Go to ba.com, find stats for states
  # extract the name, # breweries, rank, $impact, barrels/year, per cap
  # instantiate a state
  def self.scrape_ba
    site_1 = "https://www.brewersassociation.org/statistics-and-data/state-craft-beer-stats/"
    doc = Nokogiri::XML(open(site_1))

    states = doc.css(".stat-container")

    states.each do |state|
      name = state.css("#state-header").css("h1").text
      number_breweries = state.css("#per-state").css(".total").css("span.count").text
      rank = state.css("#per-state").css(".total").css("span.rank").text
      per_capita = state.css("#per-state").css("span.per-capita").css("span.count").text
      eco_impact = state.css("#economic-impact").css("span.total").css("span.count").text
      barrels = state.css("#production").css("span.total").css("span.count").text

      BrewStats::States.new(name, number_breweries, rank, per_capita, eco_impact, barrels)

    end
  end


end
