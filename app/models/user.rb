class User < ApplicationRecord
  has_many :catched_pokemons
  has_many :users, through: :catched_pokemons
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
