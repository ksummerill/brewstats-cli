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

  (Optional) Traveling to User_input? (Y/N?)
   - Shows a list of breweries in that state
   - Not sure which state to choose? Computer randomly picks a state

User_Story

Frequent traveler who loves beer and is interested in the industry. They love checking out new breweries but don't always have the time to do a lot of research.
Googling for breweries leads to a bunch of noise that the user would need to filter through
BrewStats will provide the user with the information they need in a concise way


Classes

CLI - to take in user input and display information back to the user
Scraper - this is the scrapper, getting data from the website
States - responsible for hanging on to the information from Scraper


Cli

optional:
- next_move: I want there to be a slight delay between showing stats
and then asking for the user's  next move. Look for the option to pause/delay
the program

- add a method to cli to check for a valid input?



  <!-- @states returns --> it is also an array of objects
  [#<BrewStats::States:0x00007fd85737aa28
  @barrels="71,894",
  @eco_impact="758",
  @name="Alabama",
  @number_breweries="41",
  @per_capita="1.1",
  @rank="(Ranks 38th)">,
 #<BrewStats::States:0x00007fd857bd90e8
  @barrels="210,063",
  @eco_impact="326",
  @name="Alaska",
  @number_breweries="42",
  @per_capita="7.8",
  @rank="(Ranks 37th)">,
  ......

<!-- inside list_choices -->
  # this is what "puts @prompt" gives me...
  # Select a state by it's number Arizona
  #<TTY::Prompt:0x00007fc5c02b2630>
