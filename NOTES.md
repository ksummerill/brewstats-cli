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
- Work on taking user selection and returning something hardcoded
  - Figure out return value of #list_choices
  - Use that return value to print out something hardcoded


  display_states returns one long puts for each state...
  perhaps if i shoveled each element in #display_states into a class array and then use that array to iterate over in #get_user_choice

Alabama
41
(Ranks 38th)
1.1
758
71,894
Alaska
42
(Ranks 37th)
7.8
326
210,063
Arizona
117
(Ranks 19th)
2.2
1,147
173,427
Arkansas
40
(Ranks 39th)
1.8
838
45,720
California
841
(Ranks 1st)
2.9
9,014
3,421,295
Colorado
396
(Ranks 2nd)
9.2
3,285
1,522,834
Connecticut
87
(Ranks 26th)
3.2
753
213,676
Delaware
27
(Ranks 45th)
3.7
388
298,706
District of Columbia
13
(Ranks 51st)
2.4
213
33,857
Florida
285
(Ranks 9th)
1.7
3,625
1,373,558
