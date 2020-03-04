require 'rest-client'
require 'pry'

FavoritePokemon.destroy_all
Pokemon.destroy_all
User.destroy_all
Type.destroy_all

# pokemon1 = Pokemon.create(name: "bulbasaur", pokemon_id: 1, height: 7, weight: 69, type_1: "grass")
# pokemon2 = Pokemon.create(name: "squirtle", pokemon_id: 7, height: 6, weight: 65, type_1: "water")
# pokemon3 = Pokemon.create(name: "venusaur", pokemon_id: 4, height: 10, weight: 100, type_1: "grass")
# pokemon4 = Pokemon.create(name: "mew", pokemon_id: 151, height: 4, weight: 10, type_1: "psychic")

# user1 = User.create(username: "Kristine")
# user2 = User.create(username: "Tyler")

# FavoritePokemon.create(user_id: user1.id, pokemon_id: pokemon1.id)
# FavoritePokemon.create(user_id: user2.id, pokemon_id: pokemon2.id)
# FavoritePokemon.create(user_id: user2.id, pokemon_id: pokemon3.id)



def get_pokemon
    i = 1
    while i <= 151 do
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{i}/")


        pokedata = JSON.parse(response)
        Pokemon.create(name: pokedata["name"], pokemon_id: pokedata["id"], height: pokedata["height"], weight: pokedata["weight"], type_1: pokedata["types"][-1]["type"]["name"])

        i += 1
    end
end

get_pokemon

def get_types
    i = 1
    while i <= 18 do
        response = RestClient.get("https://pokeapi.co/api/v2/type/#{i}/")

        poketype = JSON.parse(response)
        Type.create(name: poketype["name"])

        i += 1
    end
end

get_types

# binding.pry