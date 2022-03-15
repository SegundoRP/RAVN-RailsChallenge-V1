class RemoveTypeFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :type, :string
  end
end
