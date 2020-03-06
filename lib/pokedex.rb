class Pokedex

    # This class method kicks off the app
    def self.welcome
        pid = fork{ exec 'afplay', "lib/Research-Lab.mp3" }
        system("clear")
        Ascii.welcome_art
        puts "\n\nWelcome to the Pokedex for generation one Pokemon!\n\n".blue

        # Request username input from user and save to variable
        puts "Enter a new or existing username to continue:".light_yellow
        username_response = gets.chomp

        # Access User.find_user method to determine if user is new or existing
        User.find_user(username_response)
    end
    
end