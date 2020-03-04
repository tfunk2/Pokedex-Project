def display_pokemon_info(pokemon_info)
    #Figure out how to render this image in terminal
    #Front sprite
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_info.pokemon_id}.png"
    #Back sprite
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/#{pokemon_info.pokemon_id}.png"
    puts "Name: #{pokemon_info.name.capitalize}"
    puts "Pokemon ID: #{pokemon_info.pokemon_id}"
    puts "Height: #{pokemon_info.height}"
    puts "Weight: #{pokemon_info.weight}"
    puts "Type: #{pokemon_info.type_1.capitalize}"
    #figure out what menu follows this
end