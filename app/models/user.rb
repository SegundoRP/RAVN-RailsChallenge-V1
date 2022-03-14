class User < ApplicationRecord
  has_one_attached :photo
  has_many :catched_pokemons
  has_many :pokemons, through: :catched_pokemons

  # validates :photo, presence: true

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
end
