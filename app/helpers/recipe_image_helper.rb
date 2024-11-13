module RecipeImageHelper
  def self.parse_recipe_image(recipe_image_url)
    CGI.parse(recipe_image_url).flat_map(&:last).last
  end
end
