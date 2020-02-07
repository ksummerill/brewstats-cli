# Class that handles user interaction and pulls data from Stats class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  def call
   get_choices
   list_choices
   # get_user_choice
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

    prompt = TTY::Prompt.new
    prompt.enum_select("Select a state by it's number", state_names)

    # By default the choice name is the return value
  end

  # method should use return value from list_choices method to show data
  def get_user_choice
    selection = list_choices
    if selection == "Alabama"
      puts "Alabama stats: #{@states}[0]"
    elsif selection == "Alaska"
      puts "Alaska stats: #{@states}[1]"

    end
  end

  # could use this method to show the data based on the selection from get_user_choice
  # def show_data(choice)
  #
  #
  # end

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


# OG method for choices
# def list_stats
#   puts "Welcome to BrewStats!"
#   @breweries = BrewStats::Stats.all_states
#   # @breweries.each.with_index(1) do |state, i|
#   #   puts "#{i}. #{state.name}"
#   # end
# end

# input = nil
# while input != "exit"
#   puts "Type the name of a state you want to see brewery information for."
#   input = gets.strip.downcase
#   case input
#   when "alabama"
#    puts BrewStats::Stats.scrape_ba
#   when "alaska"
#    puts BrewStats::Stats.scrape_ba
#   when "list"
#    choices
#   else
#     puts "invalid entry. Please type list or exit"
#   end
# end
