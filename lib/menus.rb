require "tty-prompt"
require 'pry'

def main_menu(user)
    # Instatiate new menu prompt
    prompt = TTY::Prompt.new

    # Define menu choices
    choices = {
        'Input a Pokemon by Name' => 1,
        'Input a Pokemon by ID' => 2,
        'Select a Pokemon Type to view a list of Pokemon' => 3
    }

    # Display prompt and set variable to user's choice
    menu_response = prompt.select("\nSelect an option to learn more about the first 151 Pokemon:", choices)

    # Conditional logic based on user choice selection
    case menu_response
    when 1
        puts "Enter Pokemon Name:"
        poke_name_response = gets.chomp.downcase
        select_pokemon_by_name(poke_name_response)
    when 2
        puts "Enter Pokemon ID between 1-151:"
        poke_id_response = gets.chomp
        select_pokemon_by_id(poke_id_response)
    when 3
        type_menu
    end
end

def type_menu
    prompt = TTY::Prompt.new
    choice_types = Type.list_of_types.sort
    poke_type_response = prompt.select("Select a Pokemon Type:", choice_types)

    list_pokemon_by_type(poke_type_response)

end
# binding.pry