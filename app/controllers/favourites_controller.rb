class FavouritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    user = Current.user
    favourite = FavouriteRecipe.new(user:, recipe:)

    if favourite.call
      redirect_to root_path, notice: "Added to favourites"
    else
      redirect_to root_path, alert: "Failed to add to favourites"
    end
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    user = Current.user
    unfavourite = UnfavouriteRecipe.new(user:, recipe:)

    if unfavourite.call
      redirect_to root_path, notice: "Removed from favourites"
    else
      redirect_to root_path, alert: "Failed to remove from favourites"
    end
  end
end
