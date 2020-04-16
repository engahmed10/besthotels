require "pry"
require 'nokogiri'
require 'open-uri'
require_relative "./besthotels/version"
require_relative "./besthotels/cli"
require_relative "./besthotels/scraper"
require_relative "./besthotels/hotels"
require_relative "./besthotels/customer"
require 'colorized_string'
require 'colorize'


module Besthotels
  class Error < StandardError;  end
  # Your code goes here...
end

