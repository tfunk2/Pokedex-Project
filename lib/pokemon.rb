class Pokemon < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :user, through: :favorite_pokemon
    belongs_to :type

    def self.select_pokemon_by_name(pokemon_name)
        found_pokemon = all.find_by(name: pokemon_name)
        if !found_pokemon
            puts "Could not find that Pokemon. Please try your search again."
            puts "\n"
            main_menu(user)
        else
            display_pokemon_info(found_pokemon)
        end
    end

    def self.select_pokemon_by_id(poke_id)
        found_pokemon_by_id = all.find_by(pokemon_id: poke_id)
        if !found_pokemon_by_id
            puts "Could not find that Pokemon. Please try your search again."
            puts "\n"
            main_menu(user)
        else
            display_pokemon_info(found_pokemon_by_id)
        end
    end
     
    def list_pokemon_by_type(pokemon_type)
    
    end

end