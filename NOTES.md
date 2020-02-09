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

- exit program prints the right message (calls the right method) but
the program cycles back to "Select a state..."
- next_move method, selecting "select another state" prints "See you later!"
but does cycle back to "Select a state..."

- One first selection, picking 1, I have to enter 1 twice before I see stats
- Selecting 2, I have to enter 2 twice, then it jumps to next_move and asks
"what do you want to do next?"
- 



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

  # method should use return value from list_choices method to show data
  # def get_user_choice
  #   # state_name.find |state|
  #   #   list_choices == state.name
  #   # end
  #
  #   if list_choices == "Alabama"
  #
  #     # puts BrewStats::States.state_name[0..5]
  #   # elsif list_choices == "Alaska"
  #   #   puts "Alaska stats: "
  #   #   puts BrewStats::States.state_name[6..10]
  #   else
  #     puts "invalid entry. Please type exit"
  #   end
  # end
