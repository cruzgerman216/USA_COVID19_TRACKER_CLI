require 'open-uri'
require 'nokogiri'
require_relative "./USA_COVID19_TRACKER_CLI/version"

module USACOVID19TRACKERCLI
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./state.rb"
require_relative "./USA_COVID19_TRACKER_CLI/cli"
require_relative "./scraper.rb"


