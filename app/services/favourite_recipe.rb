class FavouriteRecipe
  def initialize(user:, recipe:)
    @user = user
    @recipe = recipe
  end

  def call
    favourite_recipe
  end

  private

  attr_reader :user, :recipe

  def favourite_recipe
    user.favourite_recipes << recipe unless user.favourite_recipes.include?(recipe)
    user.save!
  end
end
