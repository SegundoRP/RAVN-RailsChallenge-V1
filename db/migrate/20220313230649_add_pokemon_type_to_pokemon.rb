class AddPokemonTypeToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :pokemon_type, :string
  end
end
