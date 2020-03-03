require_relative 'config/environment'
require 'pry'

Cli.new.welcome

user_response = gets.chomp

binding.pry


