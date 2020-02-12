require 'open-uri'
require 'nokogiri'
require 'tty-prompt'

require_relative './brewstats/version'
require_relative './brewstats/cli'
require_relative './brewstats/scraper'
require_relative './brewstats/states'

module BrewStats
  class Error < StandardError; end
end
