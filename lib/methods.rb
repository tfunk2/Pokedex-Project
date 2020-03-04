require 'pry'

def select_pokemon_by_name(pokemon_name)
    found_pokemon = Pokemon.all.find_by(name: pokemon_name)
    if !found_pokemon
        puts "Could not find that Pokemon. Please try your search again."
        puts "\n"
        main_menu
    else
        display_pokemon_info(found_pokemon)
    end
end

def select_pokemon_by_id(poke_id)
    found_pokemon_by_id = Pokemon.all.find_by(pokemon_id: (poke_id).to_i)
    if !found_pokemon_by_id
        puts "Could not find that Pokemon. Please try your search again."
        puts "\n"
        main_menu
    else
        display_pokemon_info(found_pokemon_by_id)
    end
end

def list_pokemon_by_type(pokemon_type)

end

def display_pokemon_info(pokemon_info)
    #figure out how to render this image in terminal
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_info.pokemon_id}.png"
    puts "Name: #{pokemon_info.name.capitalize}"
    puts "Pokemon ID: #{pokemon_info.pokemon_id}"
    puts "Height: #{pokemon_info.height}"
    puts "Weight: #{pokemon_info.weight}"
    puts "Type: #{pokemon_info.type_1.capitalize}"
    #figure out what menu follows this
end