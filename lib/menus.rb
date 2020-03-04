require "tty-prompt"
require 'pry'



def type_menu
    prompt = TTY::Prompt.new
    choice_types = Type.list_of_types.sort
    poke_type_response = prompt.select("Select a Pokemon Type:", choice_types)

    list_pokemon_by_type(poke_type_response)

end
# binding.pry