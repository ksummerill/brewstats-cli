# Class that handles user interaction and pulls data from Stats class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  def call
   choices
   data_from_user_input
   next_move
   goodbye
  end

  # https://github.com/piotrmurach/tty-prompt - used to number and prompt user
  # By default the choice name is used as return value
  def choices
    puts "Welcome to BrewStats!"
    choices = []
    # need to grab just the state name in the line below
    choices << BrewStats::States.initialize

    # binding.pry
    prompt = TTY::Prompt.new
    prompt.enum_select("Select a state by it's number", choices)
  end


  # method should call over to scraper.rb to collect and return data for user's selection
  def data_from_user_input
    if choices == "Alabama"
      puts "You made it to Alabama"
    elsif choices == "Alaska"
      puts "I can see Russia from my house"

    # state_data = BrewStats::Scraper.scrape_ba
    # BrewStats::States.make_states
    end
  end

  def show_data(choice)


  end



  def next_move
    choices = %w(exit, next_state)
    prompt = TTY::Prompt.new
    prompt.select("What do you want to do next?") do |menu|
      menu.choice
    end



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
  end

  def goodbye
    puts "See you later!"
  end


end


# OG method for choices
# def list_stats
#   puts "Welcome to BrewStats!"
#   @breweries = BrewStats::Stats.all_states
#   # @breweries.each.with_index(1) do |state, i|
#   #   puts "#{i}. #{state.name}"
#   # end
# end
