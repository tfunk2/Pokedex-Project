# Generation 1 Pokedex
Our version of a "Pokedex" is a CLI application that allows new or returning users to display information from each of the first 151 "Pokemon", and add or remove "Pokemon" from a user's "Favorite Pokemon" collection.

## Motivation
We created this repo as a project for our first "Module" in the Immersive Software Engineering Bootcamp at Flatiron School Denver.

## Built Using
Ruby 2.6.1 / Active Record - on Mac OS Catalina

## API Reference
PokeAPI - https://pokeapi.co/

This API rocks if you are a "Pokemon" fan, and want to have access to all the "Pokemon" information you can handle.

## How to use/open
Fork and clone this repository, open in a code editor.

From the root directory of this project, in the terminal, use command:
```
bundle install
```
While still in the root directory, to create local database tables use rake command:
```
rake db:migrate
```

Then, to seed the tables from the 'PokeAPI', use rake command:
```
rake db:seed
```

Finally, start the app with this command:
```
ruby runner.rb
```
You should now see the intro to the Pokedex app.

### Instructions / Walkthrough
If returning, type your username, and hit return/enter. 

If new user, type the desired username and hit return/enter.

For each menu that appears in the app, use the 'up' and 'down' keys to highlight an option, and then press return/enter to make a choice.

#### Main Menu: Learn about a Pokemon
This option takes the user to a menu that allows them to choose which method they would like to input the "Pokemon" they are searching for the options are to search by name, search by "Pokemon ID" number (1 - 151), or the user can access a list of "Pokemon Types" that allows them to search through a list of "Pokemon" belonging to that "Type". 

#### Main Menu: See my Favorite Pokemon
This option allows the current user to see a list of "Pokemon" that were previously added to their "Favorite Pokemon" list. This is followed by the option to select and view the displayed information for a single "Pokemon". Which then brings you to a sub-menu that gives you two more options, to "Remove Pokemon from my Favorites", or to return to the main menu.

#### Main Menu: Update my username
This option allows a user to change their username, and keep all of favorite "Pokemon" in their "Favorite Pokemon" collection.

#### Main Menu: Switch user
This option allows the current user to switch to another account if it has previously been created from their local machine. If the username does not exist, "Pokedex" will create a new username with the username entered.

#### Main Menu: Goodbye
This last option exits the application and returns you to your terminal's shell.

### Final comments
Thanks for opening and tinkering with our version of a "Pokemon" generation 1 "Pokedex", we hope it was enjoyable! Please understand this is our first ever programming project using any kind of code language, we would love feedback that is constructive and helpful from all who made it this far!