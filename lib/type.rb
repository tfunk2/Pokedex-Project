class Type < ActiveRecord::Base
    has_many :pokemon

    def self.type_menu
        prompt = TTY::Prompt.new
        choice_types = list_of_types.sort
        poke_type_response = prompt.select("Select a Pokemon Type:", choice_types)
    
        Pokemon.list_pokemon_by_type(poke_type_response)
    
    end

    def self.list_of_types
        all.map do |type|
            type.name.capitalize
        end
    end
end