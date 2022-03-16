class User < ApplicationRecord
  has_one_attached :photo
  has_many :catched_pokemons
  has_many :pokemons, through: :catched_pokemons

  validates :email, presence: true, uniqueness: true, format: { with: /\S+@.+\.\S+/, message: "incorrect format" }
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value",
      { value: login.strip.downcase}]).first
  end

   def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
