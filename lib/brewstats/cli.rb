# Class that handles user interaction and pulls data from Stats class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  def call
   get_choices
   list_choices
   get_user_choice
   next_move
   goodbye
  end

  # choices method will grab the results from my States.all
  def get_choices
    puts "Welcome to BrewStats!"
    BrewStats::Scraper.scrape_ba
    # binding.pry
    @states = BrewStats::States.all
  end

  # Prompts user to select a state
  # https://github.com/piotrmurach/tty-prompt - used to number and prompt user
  def list_choices
    state_names = []
    @states.each do |state|
      state_names << state.name
    end

    # creates a new prompt object each time the program runs
    # By default the choice name is the return value
    @prompt = TTY::Prompt.new
    @prompt.enum_select("Select a state by it's number", state_names)

    # this is what puts @prompt gives me...
    # Select a state by it's number Arizona
    #<TTY::Prompt:0x00007fc5c02b2630>

  end

  # method should use return value from list_choices method to show data
  def get_user_choice
    selection = list_choices
    if selection == "Alabama"
      # need to somehow look for correct state name to grab/show
      puts "Alabama stats: #{display_states}"
    elsif selection == "Alaska"
      puts "Alaska stats: " + "#{display_states}"
    elsif selection == "California"
      puts "California stats: #{display_states}"
    else
      puts "invalid entry. Please type exit"
    end
  end

  def display_states
    @states.each do |state|
      # puts "-------------------"
      puts state.name
      puts state.number_breweries
      puts state.rank
      puts state.per_capita
      puts state.eco_impact
      puts state.barrels
      # puts "-------------------"
    end
    binding.pry
  end

  # after showing user data for selected state, ask what they want to do next
  # options are to exit the program or select a new state,
  # which returns the user to list_choices
  # def next_move
  #   # user_selection = return from prompt.enum_select
  #   choices = ["exit program", "select another state"]
  #   prompt = TTY::Prompt.new
  #   prompt.enum_select("What do you want to do next?", choices)
  #   # build if statement to handle choice. Use return from prompt.enum_select?
  #     # if choices == "exit program"
  #     #   goodbye
  #     # else list_choices
  #     # end
  # end
  #
  #
  # def goodbye
  #   puts "See you later!"
  # end


end
