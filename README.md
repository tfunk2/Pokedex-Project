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
To start application, from the root directory of this project, in the terminal, use command:
```
bundle install
```

This will ensure you acquire all the gems necessary to run the app. 

Then, start the app with this command:
```
ruby runner.rb
```
You should now see the intro to the Pokedex app.

### Instructions / Walkthrough
If returning, type your username, and hit return/enter. 

If new user, type the desired username and hit return/enter.

For each menu that appears in the app, use the 'up' and 'down' keys to highlight an option, and then press return/enter to make a choice.

#### Main Menu: Choice 1 - Input a Pokemon by Name
This choice requires you to type in a "Pokemon's" name/species if you know which one you want to search for. Not case sensitive. Once submitted, if the "Pokemon" is found, you will see that "Pokemon's" info displayed.

##### Sub Menu: Choice 1.a - Add Pokemon to my Favorites
This option allows you to add the "Pokemon" you originally searched for to your "Favorite Pokemon" list.

##### Sub Menu: Choice 1.b - Remove Pokemon from my Favorites
This option allows you to remove the "Pokemon" you originally searched for from your "Favorite Pokemon" list.

##### Sub Menu: Choice 2 - Return to the Main Menu
Pretty self-explanatory, takes you back to the Main Menu.

#### Main Menu: Choice 2 _ Input a Pokemon by ID
This choice requires you to type in a "Pokemon's" ID number (an integer from 1 - 151).

##### Sub Menu: Choice 1.a, Choice 1.b, Choice 2
Each works the same as the choices from the Sub Menu above.

#### Main Menu: Choice 3 - Select a Pokemon Type to view a list of Pokemon
This provides a list of "Pokemon Types" to choose from.

##### Select one of the 15 "Pokemon Type" options
Another menu will appear, a range of "Pokemon" names corresponding to the "Type" selected will appear as menu options. Pick a "Pokemon" from this menu and display it's stats and info.