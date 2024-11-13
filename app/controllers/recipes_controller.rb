class RecipesController < ApplicationController
  allow_unauthenticated_access only: [ :index ]
  def index
    if params[:query].present?
      @pagy, @records = pagy(Recipe.by_ingredients(params[:query]))
    else
      @pagy, @records = pagy(Recipe.all)
    end
  end
end
