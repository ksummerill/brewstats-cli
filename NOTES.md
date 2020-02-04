Brew stats -
https://www.brewersassociation.org/statistics-and-data/state-craft-beer-stats/
https://www.brewersassociation.org/directories/breweries

Learn more about beer state-by-state!
Enter a state...

User_input = Alabama

Returns
  - Number of Craft Breweries
  - Economic impact
  - Production
  - Breweries per capita and rank

  Traveling to User_input? (Y/N?)
   - Shows a list of breweries in that state
   - Optional: filter by taproom, microbreweries, brewpub, regional and large


Other options
- Not sure which state to choose? Computer randomly picks a state

User_Story

Frequent traveler who loves beer and is interested in the industry. They love checking out new breweries but don't always have the time to do a lot of research.
Googling for breweries leads to a bunch of noise that the user would need to filter through
BrewStats will provide the user with the information they need in a concise way


Classes

CLI - to take in user input and display information back to the user
BeerRun - this is the scrapper, getting data from the website
BreweryOptions - responsible for hanging on to the information from BeerRun
