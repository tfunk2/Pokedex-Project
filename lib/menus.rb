require "tty-prompt"
require 'pry'

def main_menu
    prompt = TTY::Prompt.new
    choices = {
        'Input a Pokemon by Name' => 1,
        'Input a Pokemon by ID' => 2,
        'Select a Pokemon Type to view a list of Pokemon' => 3
    }
    menu_response = prompt.select("Select an option to learn more about the first 151 Pokemon:", choices)
    case menu_response
    when 1
        puts "Enter Pokemon Name:"
        poke_name_response = gets.chomp.downcase
        select_pokemon_by_name(poke_name_response)
    when 2
        puts "Enter Pokemon ID between 1-151:"
        poke_id_response = gets.chomp
        select_pokemon_by_name(poke_id_response)
    when 3
        type_menu
    end
end

def type_menu
    prompt = TTY::Prompt.new
    types = {
        
    }
    poke_type_response = prompt.select("Select a Pokemon Type:", types)
end
# binding.pry