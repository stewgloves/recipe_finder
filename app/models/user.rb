class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :user_recipes
  has_many :favourite_recipes, through: :user_recipes, source: :recipe

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
