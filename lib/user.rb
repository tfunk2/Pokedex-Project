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
            puts "\nWelcome back, #{@found_user.username}! Hard to stay away, I know!".blue
            @found_user.main_menu
        else
            create_user(user_input)
        end
    end

    # This class method is to create a new user instance based on username input by user, then brings user to main menu
    def self.create_user(user_input)
        @new_user = create(username: user_input)
        puts "\nNew username detected. Hello, #{@new_user.username}! Ready to check out some Pokemon?".blue
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
        menu_response = prompt.select("\nWhat would you like to do?".light_yellow, choices)

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
            puts "\nCome back to learn more about Pokemon! See you later!\n\n".blue
        end
    end

    # This method lists current user's Favorite Pokemon and allows user to select Pokemon to view info
    def favorite_pokemon_list
        # Refreshed associated pokemon relationship from favorite_pokemons table
        pokemon.reload

        # Conditional statement to display list of favorite pokemon based on whether user has favorite pokemon added
        if pokemon == []
            puts "\nYou don't have any Favorites yet! Surely you like at least one Pokemon!".light_red
            main_menu
        else
            # Instatiate new menu prompt
            prompt = TTY::Prompt.new(active_color: :bright_magenta)

            # Define choices as list of pokemon from current user's associated Favorite Pokemon
            list = pokemon.map do |favorite|
                favorite.name.capitalize
            end

            # Display prompt and set variable to user's choice
            menu_response = prompt.select("\nHere are your Favorite Pokemon! Select one to see it's info:".light_yellow, list)
            Pokemon.select_pokemon_by_name(menu_response,self)
        end
    end

    # This method allows current user to update their username in the users table
    def update_username
        # Requests input from user and saves to variable
        puts "\nWhat would you like to change your username to? \nHow about Ash Ketchum? It just has a certain ring to it.".light_yellow
        new_username = gets.chomp

        # Check if username already exists
        @found_user = User.all.find_by(username: new_username)

        # Conditional statement: If user exists, display error message, else update user
        if @found_user
            puts "\nSorry, that username already exists!".red
        else
            # Updates user instance based on input username
            self.update(username: new_username)
            puts "\n#{username} huh? \nI was just getting used to that other name, but I'll call you #{username} from now on.".blue
        end
        
        # Return to main_menu
        main_menu
    end
end