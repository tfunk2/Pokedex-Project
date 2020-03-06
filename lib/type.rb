class Type < ActiveRecord::Base
    has_many :pokemon

    # This menu displays list of Types for user selection
    def self.type_menu(user)
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
        choice_types = list_of_types.sort
        poke_type_response = prompt.select("\nSelect a Pokemon Type:".light_yellow, choice_types, filter: true)
    
        Pokemon.list_pokemon_by_type(poke_type_response, user)
    
    end

    # This method creates list of Types from types table and excludes specific types
    def self.list_of_types
        all_types = all.map do |type|
            type.name.capitalize
        end
        all_types.reject do |type|
            type == "Steel" || type == "Fairy" || type == "Dark" || type == "Flying"
        end
    end
end