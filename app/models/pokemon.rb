class Pokemon < ApplicationRecord
  has_one_attached :photo
  has_many :catched_pokemons, dependent: :destroy
  has_many :users, through: :catched_pokemons

  validates :photo, presence: true
  validates :country, presence: true
  validates :main_technique, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :pokemon_type, presence: true
end
