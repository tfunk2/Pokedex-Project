class Pokedex

    # This class method kicks off the app
    def self.welcome
        system("clear")
        Ascii.welcome_art
        puts "\nWelcome to the Pokedex for generation one Pokemon!\n\n"

        # Request username input from user and save to variable
        puts "Enter a new or existing username to continue:"
        username_response = gets.chomp

        # Access User.find_user method to determine if user is new or existing
        User.find_user(username_response)
    end
    
end