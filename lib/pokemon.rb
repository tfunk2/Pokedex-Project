class Pokemon < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :user, through: :favorite_pokemon
    belongs_to :type
end