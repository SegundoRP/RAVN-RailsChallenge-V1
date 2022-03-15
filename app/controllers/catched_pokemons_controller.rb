class CatchedPokemonsController < ApplicationController

  def create
    @catched_pokemon = CatchedPokemon.new(catched_pokemon_params)
    @catched_pokemon.user = current_user
    authorize @catched_pokemon

    if @catched_pokemon.save
      redirect_to trainers_path
    end
  end

  private

  def catched_pokemon_params
    params.require(:catched_pokemon).permit(:alias, :user_id, :pokemon_id)
  end
end
