class Pokemon < ApplicationRecord
  has_one_attached :photo
  has_many :catched_pokemons, dependent: :destroy
  has_many :users, through: :catched_pokemons

  validates :photo, presence: true
end
