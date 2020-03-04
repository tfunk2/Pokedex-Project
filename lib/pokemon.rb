class Pokemon < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :user, through: :favorite_pokemon
    belongs_to :type

    def self.select_pokemon_by_name(pokemon_name)
        @found_pokemon = all.find_by(name: pokemon_name)
        if !@found_pokemon
            puts "Could not find that Pokemon. Please try your search again."
            puts "\n"
            main_menu(user)
        else
            @found_pokemon.display_pokemon_info
        end
    end

    def self.select_pokemon_by_id(poke_id)
        @found_pokemon_by_id = all.find_by(pokemon_id: poke_id)
        if !@found_pokemon_by_id
            puts "Could not find that Pokemon. Please try your search again."
            puts "\n"
            main_menu(user)
        else
            @found_pokemon_by_id.display_pokemon_info
        end
    end
    
    def display_pokemon_info
        #Figure out how to render this image in terminal
        #Front sprite
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_id}.png"
        #Back sprite
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/#{pokemon_id}.png"
        puts "Name: #{name.capitalize}"
        puts "Pokemon ID: #{pokemon_id}"
        puts "Height: #{height}"
        puts "Weight: #{weight}"
        puts "Type: #{type_1.capitalize}"
        #figure out what menu follows this
    end

    def list_pokemon_by_type(pokemon_type)
    
    end

end