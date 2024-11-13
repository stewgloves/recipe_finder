# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FavouritesController', type: :request do
  let!(:user)  { create(:user) }
  let(:recipe) { create(:recipe) }
  let!(:favourite_recipe) { create(:recipe) }

  describe 'POST /favourites' do
    context 'when user is signed in' do
      before do
        post session_path params: { email_address: user.email_address, password: user.password }
      end

      it 'allows to add recipe to recipe favourites' do
        post favourites_path, params: { recipe_id: recipe.id }

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Added to favourites')
        expect(user.favourite_recipes).to include(recipe)
      end

      it 'allows to remove recipe from favourites' do
        user.favourite_recipes << recipe

        delete favourite_path(recipe)

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Removed from favourites')
        expect(user.favourite_recipes).not_to include(recipe)
      end
    end
  end
end
