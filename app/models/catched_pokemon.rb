class CatchedPokemon < ApplicationRecord
  after_create :send_email
  belongs_to :user
  belongs_to :pokemon

  private

   def send_email
    PokemonMailer.with(catched_pokemon: self).pokemon_email.deliver!
  end
end
