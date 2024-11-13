require 'rails_helper'

RSpec.describe "RecipesController", type: :request do
  describe "GET /recipes" do
    context "when no query parameter is provided" do
      let!(:recipes) { create_list(:recipe, 3) }

      it "returns all recipes" do
        get recipes_path

        expect(response).to have_http_status(:ok)
        expect(assigns(:records)).to match_array(recipes)
      end
    end

    context "when a query parameter is provided" do
      let(:matching_recipe) { create(:recipe, ingredients: "tomato, basil") }
      let(:non_matching_recipe) { create(:recipe, ingredients: "chicken, rice") }

      it "returns recipes matching the query" do
        get recipes_path, params: { query: "tomato" }

        expect(response).to have_http_status(:ok)
        expect(assigns(:records)).to include(matching_recipe)
        expect(assigns(:records)).not_to include(non_matching_recipe)
      end
    end
  end
end
