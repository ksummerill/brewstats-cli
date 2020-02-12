# Class that handles user interaction and pulls data from States class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  # calling get_choices only on first iteration of the program so we scrape once
  def call
    get_choices

    @choice = ""
    until @choice == "exit"
      list_choices
      display_states
      sleep 2
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

  # Prompts user to select a state (https://github.com/piotrmurach/tty-prompt)
  # state_names contains a list of strings of state names in one large array
  # By default the choice name is the return value of the method
  def list_choices
    state_names = []
    @states.each do |state|
      state_names << state.name
    end

    prompt = TTY::Prompt.new
    @user_selection = prompt.enum_select("Select a state by it's number", state_names)
  end

  # this method will iterate through @@all, find the object whose name matches the user's input
  def display_states
      @states.find do |state|
        if state.name == @user_selection
        puts "\n"
        puts "-----#{state.name}-----"
        puts "#{state.number_breweries} breweries #{state.rank}"
        puts "#{state.per_capita} breweries per 100,000 adults (+21)"
        puts "$#{state.eco_impact} million in economic impact"
        puts "#{state.barrels} barrels of craft beer produced annually"
        puts "-------------------"
      end
    end
  end

  # after showing user data for selected state, ask user what they want to do next
  # options are to exit the program or select a new state, which returns the user to list_choices
  def next_move
    puts "What do you want to do next? Type any key to restart or type 'exit' to leave"
    @choice = gets.strip
  end


  def goodbye
    puts "See you later!"
  end


end
