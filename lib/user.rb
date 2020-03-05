class User < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :pokemon, through: :favorite_pokemon

    # This class method is used to determine if username entered is new or existing
    def self.find_user(user_input)
        # Search users table for user instance based on input username and save object to instance variable
        @found_user = all.find_by(username: user_input)

        # Conditional statement: If user exists, bring user to main menu; else initiate User.create_user
        if @found_user
            system("clear")
            puts "\nWelcome back, #{@found_user.username}!".light_blue
            @found_user.main_menu
        else
            create_user(user_input)
        end
    end

    # This class method is to create a new user instance based on username input by user, then brings user to main menu
    def self.create_user(user_input)
        @new_user = create(username: user_input)
        puts "\nNew username detected. Hello, #{@new_user.username}!".light_blue
        @new_user.main_menu
    end

    # This is the first menu that will display for a user
    def main_menu
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
            
        # Define menu choices
        choices = {
            'Learn about a Pokemon' => 1,
            'See my Favorite Pokemon' => 2,
            'Update my username' => 3,
            'Switch user' => 4,
            'Goodbye' => 5
        }

        # Display prompt and set variable to user's choice
        menu_response = prompt.select("\nSelect an option from the menu:".light_yellow, choices)

        # Conditional logic based on user choice selection
        case menu_response
        when 1
            Pokemon.search_menu(self)
        when 2
            favorite_pokemon_list
        when 3
            update_username
        when 4
            Pokedex.welcome
        when 5
            puts "\nSee you later!\n\n".light_blue
        end
    end

    # This method lists current user's Favorite Pokemon and allows user to select Pokemon to view info
    def favorite_pokemon_list
        # Refreshed associated pokemon relationship from favorite_pokemons table
        pokemon.reload

        # Conditional statement to display list of favorite pokemon based on whether user has favorite pokemon added
        if pokemon == []
            puts "\nYou don't have any favorites yet!".light_red
            main_menu
        else
            # Instatiate new menu prompt
            prompt = TTY::Prompt.new(active_color: :bright_magenta)

            # Define choices as list of pokemon from current user's associated Favorite Pokemon
            list = pokemon.map do |favorite|
                favorite.name.capitalize
            end

            # Display prompt and set variable to user's choice
            menu_response = prompt.select("\nHere are your Favorite Pokemon! Select one to view its information:".light_yellow, list)
            Pokemon.select_pokemon_by_name(menu_response,self)
        end
    end

    # This method allows current user to update their username in the users table
    def update_username
        # Requests input from user and saves to variable
        puts "\nWhat would you like to change your username to?".light_yellow
        new_username = gets.chomp

        # Updates user instance based on input username
        self.update(username: new_username)
        puts "\nGreat! Thanks, #{username}.".light_blue
        
        # Return to main_menu
        main_menu
    end
end