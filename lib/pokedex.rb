class Pokedex

    def welcome
        system("clear")
        puts "Welcome to the Pokedex for generation one Pokemon!\n\n"
        puts "Enter a new or existing username to continue:"
        username_response = gets.chomp
        User.find_user(username_response)
    end
    
end