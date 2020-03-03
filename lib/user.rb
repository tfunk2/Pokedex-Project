class User < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :pokemon, through: :favorite_pokemon
end