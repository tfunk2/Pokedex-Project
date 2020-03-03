class CreatePokemonTable < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokemon_id
      t.integer :height
      t.integer :weight
      t.string :type_1
      t.string :type_2
    end
  end
end
