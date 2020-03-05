require 'pry'
class Pokemon < ActiveRecord::Base
    has_many :favorite_pokemon
    has_many :user, through: :favorite_pokemon
    belongs_to :type

    # Menu options to search for a Pokemon
    def self.search_menu(user)
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
    
        # Define menu choices
        choices = {
            'Input a Pokemon by Name' => 1,
            'Input a Pokemon by ID' => 2,
            'Select a Pokemon Type to view a list of Pokemon' => 3,
            'Return to Main Menu' => 4
        }
    
        # Display prompt and set variable to user's choice
        menu_response = prompt.select("\nSelect an option to learn more about the first 151 Pokemon:".light_yellow, choices)
    
        # Conditional logic based on user choice selection
        case menu_response
        when 1
            puts "\nEnter Pokemon Name:".light_yellow
            poke_name_response = gets.chomp.downcase
            Pokemon.select_pokemon_by_name(poke_name_response,user)
        when 2
            puts "\nEnter Pokemon ID between 1-151:".light_yellow
            poke_id_response = gets.chomp
            Pokemon.select_pokemon_by_id(poke_id_response,user)
        when 3
            Type.type_menu(user)
        when 4
            user.main_menu
        end
    end

    # This method takes user text input based on 'Input by Pokemon Name' choice and searches for a Pokemon
    def self.select_pokemon_by_name(pokemon_name,user)
        # Search pokemons table for pokemon instance that matches cleaned user input based on pokemon_name and saves object to instance variable
        @found_pokemon = all.find_by(name: pokemon_name.downcase)

        # Conditional statement: If pokemon not found, return to search menu, otherwise access User#display_pokemon_info
        if !@found_pokemon
            puts "Could not find that Pokemon. Please try your search again.".light_red
            puts "\n"
            search_menu(user)
        else
            @found_pokemon.display_pokemon_info(user)
        end
    end

    # This method takes user text input based on 'Input by Pokemon ID' choice and searches for a Pokemon
    def self.select_pokemon_by_id(poke_id,user)
        # Search pokemons table for pokemon instance that matches user input based on pokemon_id and saves object to instance variable
        @found_pokemon_by_id = all.find_by(pokemon_id: poke_id)

        # Conditional statement: If pokemon not found, return to search menu, otherwise access User#display_pokemon_info
        if !@found_pokemon_by_id
            puts "Could not find that Pokemon. Please try your search again.".light_red
            puts "\n"
            search_menu(user)
        else
            @found_pokemon_by_id.display_pokemon_info(user)
        end
    end
    
    # This method displays list of Pokemon to select that match Type input by user from Type.type_menu based on a Pokemon's type_1
    def self.list_pokemon_by_type(pokemon_type, user)
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new(active_color: :bright_magenta)

        # Define choices to be Pokemon names from pokemons table that match user input based on type_1
        pokemon_list = all.where(type_1: pokemon_type.downcase)
        pokemon_choices = pokemon_list.map do |pokemon|
            pokemon.name.capitalize
        end

        # Display prompt and set variable to user's choice
        pokemon_choice_response = prompt.select("\nSelect a Pokemon".light_yellow, pokemon_choices.sort, filter: true)

        # Based on Pokemon name selected, access Pokemon#select_pokemon_by_name to get pokemon object
        select_pokemon_by_name(pokemon_choice_response, user)
    end

    # Display all ascii art and stats for a single pokemon
    def display_pokemon_info(user)
        Ascii.art(pokemon_id)

        puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n".light_yellow
        puts "Name: #{name.capitalize}".light_blue
        puts "Pokemon ID: #{pokemon_id}".light_blue
        puts "Height: #{height}".light_blue
        puts "Weight: #{weight}".light_blue
        puts "Type: #{type_1.capitalize}".light_blue
        puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n".light_yellow
        
        # Display additional options menu for this Pokemon
        more_options_menu(user)
    end

    # This method displays additional options menu when vieweing a Pokemon
    def more_options_menu(user)
        # Instatiate new menu prompt
        prompt = TTY::Prompt.new(active_color: :bright_magenta)

        # Define menu choices based on whether Pokemon is one of current user's Favorite Pokemon. Note: user paramater is the user object that has been passed in from main_menu > search menu ...
        if FavoritePokemon.all.find_by(user_id: user.id, pokemon: self) 
            choices = {
                'Remove Pokemon from my Favorites' => 2,
                'Return to Main Menu' => 4
            }
        else
            choices = {
                'Add Pokemon to my Favorites' => 1,
                'Return to Main Menu' => 4
            }
        end
    
        # Display prompt and set variable to user's choice
        menu_response = prompt.select("\nMore options:".light_yellow, choices)
        
        # Conditional logic based on user choice selection
        case menu_response
        when 1
            add_to_user_favorites(user)
        when 2
            remove_from_user_favorites(user)
        when 4
            system("clear")
            user.main_menu
        end
    end

    # This method creates instance in favorite_pokemons table to establish relationship between pokemon selected and current user
    def add_to_user_favorites(user_passed)
        FavoritePokemon.create(user: user_passed, pokemon: self)

        system("clear")
        puts "\n#{name.capitalize} added to Favorites.".light_green

        # Return user to main_menu
        user_passed.main_menu
    end
    
    # This method deletes instance in favorite_pokemons table between pokemon selected and current user
    def remove_from_user_favorites(user_passed)
        favorite_pokemon.find_by(user: user_passed).delete

        system("clear")
        puts "\n#{name.capitalize} removed from Favorites.".light_green

        # Return user to main_menu
        user_passed.main_menu
    end

end
