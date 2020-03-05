require 'rest-client'
require 'pry'

FavoritePokemon.destroy_all
Pokemon.destroy_all
User.destroy_all
Type.destroy_all

# Gets Pokemon data from API to seed pokemons table
def get_pokemon
    i = 1
    while i <= 151 do
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{i}/")


        pokedata = JSON.parse(response)
        Pokemon.create(name: pokedata["name"], pokemon_id: pokedata["id"], height: pokedata["height"], weight: pokedata["weight"], type_1: pokedata["types"][-1]["type"]["name"])

        i += 1
    end
end

# Gets Pokemon Type data from API to seed types table
def get_types
    i = 1
    while i <= 18 do
        response = RestClient.get("https://pokeapi.co/api/v2/type/#{i}/")

        poketype = JSON.parse(response)
        Type.create(name: poketype["name"])

        i += 1
    end
end

get_pokemon
get_types