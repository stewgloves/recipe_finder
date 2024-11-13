class RecipesController < ApplicationController
  allow_unauthenticated_access only: [ :index ]
  def index
    # pg_search sanitizes input before running the query
    if params[:query].present?
      @pagy, @records = pagy(Recipe.by_ingredients(params[:query]))
    else
      @pagy, @records = pagy(Recipe.all)
    end
  end
end
