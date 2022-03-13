class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :main_technique
      t.string :country
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
