class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = policy_scope(Pokemon).paginate(page: params[:page], per_page: 3)

    if params[:search].present?
      if params[:search][:query].empty?
        @pokemons = policy_scope(Pokemon).paginate(page: params[:page], per_page: 3)
      else
        sql_query = " \
          name iLIKE :query \
          OR pokemon_type iLIKE :query \
        "
        @pokemons = policy_scope(Pokemon).where(sql_query, query: "%#{params[:search][:query]}%").paginate(page: params[:page], per_page: 3)
      end
    end
  end

  def add
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    authorize @pokemon
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pokemon.update(pokemon_params)
      redirect_to pokemon_path(@pokemon)
    else
      render :edit
    end
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_path
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :main_technique, :country, :pokemon_type, :description, :photo)
  end
end
