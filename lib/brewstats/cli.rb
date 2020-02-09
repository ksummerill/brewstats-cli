# Class that handles user interaction and pulls data from Stats class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  def call
    choices = ""
    until choices == "exit program"
      get_choices
      list_choices
      display_states
      next_move
    end
   goodbye
  end

  # choices method will grab the results from my States.all
  def get_choices
    puts "Welcome to BrewStats!"
    BrewStats::Scraper.scrape_ba
    @states = BrewStats::States.all
  end

  # Prompts user to select a state
  # https://github.com/piotrmurach/tty-prompt - used to number and prompt user
  # state_names contains a list of strings of state names in one large array
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
    # if i can find the output from @prompt and store it in an instance variable
    # I could use it in get_user_choice, set equal to selection
  end

  # this method should be able to iterate through @@all, find the object
  # whose name matches the user's input (by calling list_choices)
  def display_states
    # @states is = to BrewStats::States.all
      @states.find do |state|
        if state.name == self.list_choices
        puts "-------------------"
        puts state.name
        puts state.number_breweries
        puts state.rank
        puts state.per_capita
        puts state.eco_impact
        puts state.barrels
        puts "-------------------"
      end
      next_move
    end

  end



  # after showing user data for selected state, ask what they want to do next
  # options are to exit the program or select a new state,
  # which returns the user to list_choices
  def next_move
    # user_selection = return from prompt.enum_select
    choices = ["exit program", "select another state"]
    prompt = TTY::Prompt.new
    prompt.enum_select("What do you want to do next?", choices)
    # build if statement to handle choice. Use return from prompt.enum_select?
      if choices == "select another state"
        list_choices
      else choices == "exit program"
        goodbye
      end
  end


  def goodbye
    puts "See you later!"
  end


end
