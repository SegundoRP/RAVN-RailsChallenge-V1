class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def add
    @pokemon = Pokemon.new
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :main_technique, :country, :pokemon_type, :description)
  end
end
