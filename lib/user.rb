class User < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :pokemon, through: :favorite_pokemon

    def self.find_user(user_input)
        @found_user = all.find_by(username: user_input)
        if @found_user
            system("clear")
            puts "\nWelcome back, #{@found_user.username}!"
            @found_user.main_menu
        else
            create_user(user_input)
        end
    end

    def self.create_user(user_input)
        @new_user = create(username: user_input)
        puts "\nNew username detected. Hello, #{@new_user.username}!"
        @new_user.main_menu
    end

    def main_menu
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new
            
        # Define menu choices
        choices = {
            'Learn about a Pokemon' => 1,
            'See my Favorite Pokemon' => 2,
            'Update my username' => 3,
            'Goodbye' => 4
        }

        # Display prompt and set variable to user's choice
        menu_response = prompt.select("\nSelect an option from the menu:", choices)

        # Conditional logic based on user choice selection
        case menu_response
        when 1
            Pokemon.search_menu(self)
        when 2
            favorite_pokemon_list
        when 3
            update_username
        when 4
            puts "\nSee you later!\n\n"
        end
    end

    def favorite_pokemon_list
        list = pokemon.map do |favorite|
            favorite.name.capitalize
        end
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new

        # Display prompt and set variable to user's choice
        menu_response = prompt.select("\nHere are your Favorite Pokemon! Select one to view its information:", list)
        Pokemon.select_pokemon_by_name(menu_response,self)
    end

    def update_username

    end
end