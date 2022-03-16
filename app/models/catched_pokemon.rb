class CatchedPokemon < ApplicationRecord
  after_create :send_email
  after_create :catch_email

  belongs_to :user
  belongs_to :pokemon

  validates :pokemon, uniqueness: { scope: :user_id, message: 'You have catched that pokemon' }

  private

  def send_email
    PokemonMailer.with(catched_pokemon: self).pokemon_email.deliver!
  end

  def catch_email
    PokemonMailer.delay(run_at: 2.minutes.from_now).reminder_email
  end
end
