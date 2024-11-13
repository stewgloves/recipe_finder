class Recipe < ApplicationRecord
  include PgSearch::Model

  has_many :user_recipes
  has_many :favourited_by, through: :user_recipes, source: :user

  scope :by_rating, ->(rating) { where(rating: rating)  }
  scope :random, ->(limit) {
    from(order("random()").limit(limit), :recipes)
  }

  pg_search_scope :by_ingredients,
                  against: :ingredients,
                  order_within_rank: "recipes.ratings DESC",
                  using: {
                    tsearch: {
                      any_word: true,
                      dictionary: "english",
                      prefix: true
                    }
                  }
end
