class PokemonMailer < ApplicationMailer

  def pokemon_email
    @catched_pokemon = params[:catched_pokemon]
    mail(to: 'andres.r4793@gmail.com', subject: 'New catched pokemon!') do |format|
      format.mjml
    end
  end
end
