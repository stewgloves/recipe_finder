class UnfavouriteRecipe < ApplicationController
  def initialize(user:, recipe:)
    @user = user
    @recipe = recipe
  end

  def call
    unfavourite_recipe
  end

  private

  attr_reader :user, :recipe

  def unfavourite_recipe
    user.favourite_recipes.delete(recipe)
  end
end
