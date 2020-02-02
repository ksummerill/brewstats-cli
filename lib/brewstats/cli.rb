# Class that handles user interaction and pulls data from Stats class

class BrewStats::Cli

  # method that gets called from bin/brew_stats to kick off program
  def call
   list_stats
   menu
   goodbye
  end

  def list_stats
    @breweries = BrewStats::Stats.all_states
    @breweries.each.with_index(1) do |state, i|
      puts "#{i}. #{state.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Welcome to BrewStats!"
      puts "Type the name of a state you want to see brewery information for."
      input = gets.strip.downcase
      case input
      when "alabama"
       puts "Info on Alabama..."
      when "alaska"
       puts "Info on Alaska..."
      when "list"
       list_stats
      else
        puts "invalid entry. Please type list or exit"
      end
    end
  end

  def goodbye
    puts "See you later!"
  end

end




# code that came with bundle install
# module Brewstats
#   module Cli
#     class Error < StandardError; end
#     # Your code goes here...
#   end
# end
