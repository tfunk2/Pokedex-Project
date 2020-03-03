require 'rest-client'
require 'pry'

FavoritePokemon.destroy_all
Pokemon.destroy_all
User.destroy_all

# pokemon1 = Pokemon.create(name: "Bulbasaur", pokemon_id: 1, height: 7, weight: 69, type_1: "Grass", type_2: "Poison")
# pokemon2 = Pokemon.create(name: "Squirtle", pokemon_id: 7, height: 6, weight: 65, type_1: "Water")

# user1 = User.create(username: "Kristine")

# FavoritePokemon.create(user_id: user1.id, pokemon_id: pokemon1.id)



def get_pokemon
    i = 1
    while i <= 151 do
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{i}/")


        pokedata = JSON.parse(response)
        Pokemon.create(name: pokedata["name"], pokemon_id: pokedata["id"], height: pokedata["height"], weight: pokedata["weight"], type_1: pokedata["types"][0]["type"]["name"])

        i += 1
    end
end

get_pokemon
# binding.pry