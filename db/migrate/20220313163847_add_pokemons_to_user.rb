class AddPokemonsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pokemons, :string
  end
end
