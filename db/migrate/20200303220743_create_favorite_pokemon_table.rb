class CreateFavoritePokemonTable < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_pokemons do |t|
      t.references :pokemon
      t.references :user
    end
  end
end
