class User < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :pokemon, through: :favorite_pokemon

    def self.find_user(user_input)
        found_user = all.find_by(username: user_input)
        if found_user
            puts "\nWelcome back, #{found_user.username}!"
            main_menu(found_user)
        else
            create_user(user_input)
        end
    end

    def self.create_user(user_input)
        new_user = create(username: user_input)
        puts "\nNew username detected. Hello, #{new_user.username}!"
        main_menu(new_user)
    end

    def favorite_pokemon_list
        pokemon.map do |favorite|
            favorite.name
        end
    end
end