class RemovePokemonsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :pokemons, :string
  end
end
