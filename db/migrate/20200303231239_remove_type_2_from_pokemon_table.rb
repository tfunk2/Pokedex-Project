class RemoveType2FromPokemonTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :type_2, :string
  end
end
