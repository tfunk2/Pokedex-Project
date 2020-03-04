require 'pry'

def user_welcome
    system("clear")
    puts "Welcome to the Pokedex for generation one Pokemon!\n\n"
    puts "Enter a new or existing username to continue:"
    username_response = gets.chomp
    find_user(username_response)
# binding.pry
end

def find_user(user_input)
    found_user = User.all.find_by(username: user_input)
    if found_user
        puts "\nWelcome back, #{found_user.username}!"
        main_menu(found_user)
    else
        create_user(user_input)
    end
end

def create_user(user_input)
    new_user = User.create(username: user_input)
    puts "\nNew username detected. Hello, #{new_user.username}!"
    main_menu(new_user)
end