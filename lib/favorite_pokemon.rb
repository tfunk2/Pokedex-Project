class FavoritePokemon < ActiveRecord::Base
    belongs_to :user
    belongs_to :pokemon
end