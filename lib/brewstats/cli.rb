class BrewStats::CLI

  def call
   puts "brewery stats"
   list_stats
  end

  def list_stats
   puts <<-DOC
      1. Alabama: 41 Craft Breweries...
      2. Alaska: 42 Craft Breweries...
   DOC
  end
end




# code that came with bundle install
# module Brewstats
#   module Cli
#     class Error < StandardError; end
#     # Your code goes here...
#   end
# end
