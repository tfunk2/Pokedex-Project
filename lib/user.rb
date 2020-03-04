class User < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :pokemon, through: :favorite_pokemon

    def favorite_pokemon_list
        pokemon.map do |favorite|
            favorite.name
        end
    end
end