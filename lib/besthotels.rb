require "pry"
require 'nokogiri'
require 'open-uri'
require_relative "./besthotels/version.rb"
require_relative "./besthotels/cli.rb"
require_relative "./besthotels/scraper.rb"
require_relative "./besthotels/hotels.rb"


module Besthotels
  class Error < StandardError; end
  # Your code goes here...
end

