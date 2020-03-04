require "tty-prompt"
require 'pry'

def main_menu
    prompt = TTY::Prompt.new
    prompt.select("Select an option to learn more about the first 151 Pokemon:", 
        'Input a Pokemon by Name',
        'Input a Pokemon by ID',
        'Select a Pokemon Type to view a list of Pokemon')
end

binding.pry